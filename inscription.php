<?php 
    session_start(); // Démarrage de la session
    require_once 'config.php'; // On inclut la connexion à la base de données
    require 'bootstrap.php';
     // Préparation de la requête
    $requete = $dbh->prepare("SELECT CLAS_NOM FROM CLASSE");
    // Exécution de la requête
    $requete->execute();
    $selectedClass = $_POST['classe'];
?>
<!DOCTYPE html>
<html lang="fr">
<head>
    <meta charset="UTF-8">
    <title>Page d'inscription</title>
    <link rel="stylesheet" href="styles.css">
</head>
<body>
<header>
    <h1 class="text-center text-white">Créer un compte</h1>
</header>

<div class="container">
    <div class="row">
            <div class="login-form">
                <?php 
                if(isset($_GET['reg_err']))
                {
                    $err = htmlspecialchars($_GET['reg_err']);

                    switch($err)
                    {
                        case 'success':
                        ?>
                            <div class="alert alert-success">
                                Inscription réussie !
                            </div>
                        <?php
                        break;

                        case 'password':
                        ?>
                            <div class="alert alert-danger">
                                Mot de passe différent
                            </div>
                        <?php
                        break;

                        case 'email':
                        ?>
                            <div class="alert alert-danger">
                                Email non valide
                            </div>
                        <?php
                        break;

                        case 'email_length':
                        ?>
                            <div class="alert alert-danger">
                                Email trop long
                            </div>
                        <?php 
                        break;

                        case 'prenom_length':
                        ?>
                            <div class="alert alert-danger">
                                Prénom trop long
                            </div>
                        <?php 

                        case 'nom_length':
                        ?>
                            <div class="alert alert-danger">
                                Nom trop long
                            </div>
                        <?php 

                        case 'already':
                        ?>
                            <div class="alert alert-danger">
                                Compte deja existant
                            </div>
                        <?php 

                    }
                }
                ?>
            <form action="function/inscription_traitement.php" method="post">
                <div class="container">
                    <div class="row">
                        <div class="col-6 p-0">
                            <div class="form-group w-50 pb-2">
                                <input type="text" name="nom" class="form-control" placeholder="Nom" required="required" autocomplete="off">
                            </div>
                            <div class="form-group w-50 pb-2">
                                <input type="text" name="prenom" class="form-control" placeholder="Prenom" required="required" autocomplete="off">
                            </div>
                        </div>
                        <div class="col-6 d-flex align-items-center">
                            <div class="form-group pb-2 ">
                            <label for="classe">Classe :</label><br>
                            <select name="classe">
                                <option value="">-- Sélectionnez une classe --</option>
                                <?php
                                // Parcours des résultats
                                    foreach ($requete as $classe) {
                                        echo "<option value=\"{$classe['CLAS_NOM']}\">{$classe['CLAS_NOM']}</option>";
                                    }
                                ?>
                            </select>
                        
                            </div>
                        </div>
                    </div>
                </div>
                
                <div class="form-group pb-2">
                    <input type="email" name="email" class="form-control" placeholder="Email" required="required" autocomplete="off">
                </div>
                <div class="form-group pb-2">
                    <input type="password" id="show_hide_password" name="password" class="form-control" placeholder="Mot de passe" required="required" autocomplete="off">
                </div>
                <div class="form-group pb-3">
                    <input type="password" name="password_retype"  id="mot_de_passe" class="form-control" placeholder="Re-tapez le mot de passe" required="required" autocomplete="off">
                </div>
                <div class="conditions text-center pb-4">
                    <input type="checkbox" id="accept_conditions" name="accept_conditions" required>
                    <label for="accept_conditions" id="condition">J'accepte </label>
                    <a href="conditions_generales.php" target="_blank">les conditions générales et la politique de confidentialité</a>
                    
                </div>
                <div class="d-grid gap-2 col-4 mx-auto">
                    <button type="submit" class="btn btn-primary btn-block">Inscription</button>
                </div>   
            </form>
        
        </div>
    </div>
</div>

<script></script>
</body>
</html>