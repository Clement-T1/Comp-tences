<?php
session_start();
require_once '../config.php'; // ajout de la connexion à la base de données

// Si la session n'existe pas ou si l'on n'est pas connecté, on redirige vers la page d'accueil
if(!isset($_SESSION['id'])){
  header('Location:index.php');
  die();
}

if ($_POST){
  // Supprimer les compétences existantes de l'utilisateur pour assurer une mise à jour propre
  $clearReq = $bdd->prepare('DELETE FROM acquerir WHERE IDENTIFIANT_ETUD = ?');
  $clearReq->execute([$_SESSION['id']]);

  // Préparer la requête d'insertion
  $insertReq = $bdd->prepare('INSERT INTO acquerir (IDENTIFIANT_ETUD, N_ITEM, ACQUISE, EN_COURS_ACQUISITION) VALUES (:IDENTIFIANT_ETUD, :N_ITEM, :ACQUISE, :EN_COURS_ACQUISITION)');

  // Parcourir chaque compétence soumise dans le formulaire
  foreach ($_POST as $item => $key){
    $acquise = 0;
    $enCours = 0;

    // Déterminer si la compétence est acquise ou en cours d'acquisition
    if (strpos($item, 'acquis') !== false){
      $acquise = 1;
    } elseif (strpos($item, 'enCoursAcquisition') !== false) {
      $enCours = 1;
    }

    // Exécuter la requête d'insertion avec les valeurs déterminées
    $insertReq->execute([
      'IDENTIFIANT_ETUD' => $_SESSION['id'],
      'N_ITEM' => $key,
      'ACQUISE' => $acquise,
      'EN_COURS_ACQUISITION' => $enCours,
    ]);
  }

  // Rediriger vers la page des compétences avec un message de succès
  header('Location:../competence.php?reg_err=success');
}else{
  // Rediriger vers la page des compétences avec un message d'erreur si aucune donnée n'a été soumise
  header('Location:../competence.php?reg_err=error');
}
?>
