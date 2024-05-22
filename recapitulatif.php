<?php 
    session_start();
    include 'config.php'; // ajout connexion bdd
    // si la session existe pas soit si l'on est pas connecté on redirige
    if(!isset($_SESSION['id'])){
        header('Location:index.php');
        die();
    }

    $reqIndicateurs = $bdd->prepare('SELECT * FROM indicateur WHERE IDENTIFIANT_ETUD = ?');
    $reqIndicateurs->execute([
        $_SESSION['id'],
    ]);
    $indicateurs = $reqIndicateurs->fetchAll();

    $reqSavoirs = $bdd->prepare('SELECT * FROM mobiliser WHERE IDENTIFIANT_ETUD = ?');
    $reqSavoirs->execute([
        $_SESSION['id'],
    ]);
    $savoirs = $reqSavoirs->fetchAll();
    
    // Ajoute d'une requête SQL afin de récupérer les compétences depuis la BDD
    $reqCompetences = $bdd->prepare('SELECT acquerir.N_ITEM, LIBEL_ENSEMBLE_COMPETENCE, ACQUISE, EN_COURS_ACQUISITION FROM acquerir INNER JOIN item_competence ON acquerir.N_ITEM = item_competence.N_ITEM WHERE IDENTIFIANT_ETUD  = ?');
    $reqCompetences->execute([
        $_SESSION['id'],
    ]);
    $competences = $reqCompetences->fetchAll();


    $title = 'Récapitulatif';
    include 'elements/header.php';
?>
<div class="container">
    <h2 class="text-center"><strong><b>Récapitulatif de vos Savoirs/Indicateurs/Compétences</b></strong></h2>
    <?php if(count($indicateurs) == 0 ):  ?>
    Aucuns indicateurs n'est enregistré. 
    <?php else: ?>
    <table class="table table-striped">
        <thead>
            <th>
                Indicateurs
            </th>
            <th>
                Libelle
            </th>
        </thead>
        <tbody>
        <?php foreach($indicateurs as $indicateur): ?>
            <tr>
                <td>
                    <?= $indicateur['N_ITEM'] ?>
                </td>
                <td>
                    <?= $indicateur['LIBEL_ITEM'] ?>
                </td>
            </tr>
        <?php endforeach; ?>
        </tbody>
    </table>
    <?php endif; ?>
    <hr>
    <?php if(count($savoirs) == 0): ?>
    Aucuns savoirs n'est enregistré. 
    <?php else: ?>
      <table class="table table-striped">
        <thead>
            <th>
                Savoirs
            </th>
            <th>
                Libelle
            </th>
        </thead>
        <tbody>
        <?php foreach($savoirs as $savoir): ?>
            <tr>
                <td>
                    <?= $savoir['N_ITEM'] ?>
                </td>
                <td>
                    <?= $savoir['LIBEL_ITEM'] ?>
                </td>
            </tr>
        <?php endforeach; ?>
        </tbody>
    </table>
    <?php endif; ?>

   <!-- Condition permettant d'afficher un message si le recapitulatif ne contient aucun competence --> 
 <?php if(count($competences) == 0): ?>
    Aucune compétence acquise n'est enregistré. 
    <?php else: ?>
      <table class="table table-striped">
        <thead>
            <th>
                Compétences acquises
            </th>
            <th>
                Libelle
            </th>
        </thead>
        <tbody>
    <!-- Condition permettant d'afficher les competences acquises dans le recapitulatif si ACQUISE = 1 -->
        <?php foreach($competences as $competence) : ?>
            <?php if($competence['ACQUISE'] == 1): ?>
            <tr>
                <td>
                    <?= $competence['N_ITEM'] ?>
                </td>
                <td>
                    <?= $competence['LIBEL_ENSEMBLE_COMPETENCE'] ?>
                </td>
            </tr>
             <?php endif; ?>
        <?php endforeach; ?>
        </tbody>
    </table>
    <?php endif; ?>
  <!-- Condition permettant d'afficher un message si le recapitulatif ne contient aucun competence en cours d'acquisition --> 
 <?php if(count($competences) == 0): ?>
    Aucune compétence en cours d'acquisition n'est enregistré. 
    <?php else: ?>
      <table class="table table-striped">
        <thead>
            <th>
                Compétences en cours d'acquisition
            </th>
            <th>
                Libelle
            </th>
        </thead>
        <tbody>
        <!-- Condition permettant d'afficher les competences en cours d'acquisition dans le récapitulatif si EN_COURS_ACQUISIITION = 1 -->
        <?php foreach($competences as $competence) : ?>
            <?php if($competence['EN_COURS_ACQUISITION'] == 1): ?>
            <tr>
                <td>
                    <?= $competence['N_ITEM'] ?>
                </td>
                <td>
                    <?= $competence['LIBEL_ENSEMBLE_COMPETENCE'] ?>
                </td>
            </tr>
             <?php endif; ?>
        <?php endforeach; ?>
        </tbody>
    </table>
    <?php endif; ?>
</div>
<?php include 'elements/footer.php'; ?>
