<?php 
session_start();
include 'config.php'; // ajout de la connexion à la base de données

// Si la session n'existe pas ou si l'on n'est pas connecté, on redirige vers la page d'accueil
if(!isset($_SESSION['id'])){
    header('Location:index.php');
    die();
}

// Récupérer toutes les compétences disponibles
$req = $bdd->prepare('SELECT * FROM item_competence');
$req->execute();
$itemCompetences = $req->fetchAll();

// Récupérer les compétences déjà acquises ou en cours d'acquisition par l'utilisateur
$reqUserComp = $bdd->prepare('SELECT * FROM acquerir WHERE IDENTIFIANT_ETUD = ?');
$reqUserComp->execute([$_SESSION['id']]);
$userCompetences = $reqUserComp->fetchAll(PDO::FETCH_ASSOC);

// Organiser les compétences de l'utilisateur 
$Competences_user = [];
foreach ($userCompetences as $userCompetence) {
    $Competences_user[$userCompetence['N_ITEM']] = [
        'ACQUISE' => $userCompetence['ACQUISE'],
        'EN_COURS_ACQUISITION' => $userCompetence['EN_COURS_ACQUISITION'],
    ];
}

$title = 'Compétences';
include 'elements/header.php'; 
?>
<div class="container">
    <div class="col-md-12">
        <div class="text-center">
        <h2 class="text-center"><strong><b>Compétences</b></strong></h2>
          <?php
          // Affichage des messages d'erreur ou de succès
          if(isset($_GET['reg_err']))
          {
            $err = htmlspecialchars($_GET['reg_err']);

            switch($err)
            {
              case 'success':
                ?>
                  <div class="alert alert-success">
                      Enregistrement effectué avec succès !
                  </div>
                <?php
                break;
              case 'error':
                ?>
                  <div class="alert alert-danger">
                      Veuillez renseigner vos compétences avant de valider !
                  </div>
                <?php
                break;
            }
          }
          ?>
            <form action="function/competence_traitement.php" method="post">
                <table class="table table-striped">
                    <thead class="thead-dark">
                        <tr>
                            <th>Acquis</th>
                            <th>En cours d'acquisition</th>
                            <th>Numéro Item</th>
                            <th>Compétences</th>
                            <th>Libelle compétences</th>
                        </tr>
                    </thead>
                    <tbody>
                        <?php foreach ($itemCompetences as $key): ?>
                        <tr>
                            <?php 
                            // Vérifier si la compétence est acquise ou en cours d'acquisition par l'utilisateur
                            $acquisChecked = isset($Competences_user[$key['N_ITEM']]) && $Competences_user[$key['N_ITEM']]['ACQUISE'] == 1 ? 'checked' : '';
                            $enCoursChecked = isset($Competences_user[$key['N_ITEM']]) && $Competences_user[$key['N_ITEM']]['EN_COURS_ACQUISITION'] == 1 ? 'checked' : '';
                            ?>
                            <td><input type="checkbox" name="<?= $key['N_ITEM'] ?>_acquis" value="<?= $key['N_ITEM'] ?>" <?= $acquisChecked ?>></td>
                            <td><input type="checkbox" name="<?= $key['N_ITEM'] ?>_enCoursAcquisition" value="<?= $key['N_ITEM'] ?>" <?= $enCoursChecked ?>></td>
                            <td><?= $key['N_ITEM'] ?></td>
                            <td><?= $key['LIBEL_ENSEMBLE_COMPETENCE'] ?></td>
                            <td><?= $key['LIBEL_ITEM'] ?></td>
                        </tr>
                        <?php endforeach; ?>
                    </tbody>
                </table>
                <button type="submit" class="btn btn-success btn-lg mb-4">Enregistrer mes compétences</button>
            </form>
        </div>
    </div>
</div>
<?php include 'elements/footer.php'; ?>
