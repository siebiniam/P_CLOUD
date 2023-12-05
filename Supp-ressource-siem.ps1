<#
.NOTES
*****************************************************************************
ETML
Nom du script: Supp-ressource-siem.ps1
Auteur: Tecle Siem Biniam
Date: 5.12.23
*****************************************************************************
.SYNOPSIS
Créer un script PowerShell pour supprimer les ressources d’un resource-group


.DESCRIPTION
Ce script PowerShell permet de supprimer des ressources d'un groupe de ressources 
en utilisant son nom.

#>

# *****************************************************************************

# Demander à l'utilisateur d'entrer le nom du groupe de ressources
$resourceGroupName = Read-Host "Entrez le nom du groupe de ressources"

# Connexion à votre compte Azure avec Azure CLI
az login

# Récupération de la liste des ressources dans le groupe de ressources
$resources = az resource list --resource-group $resourceGroupName --output json | ConvertFrom-Json

# Suppression de chaque ressource
foreach ($resource in $resources) {
    $resourceName = $resource.name
    $resourceType = $resource.type

    Write-Host "Suppression de la ressource : $resourceName de type $resourceType"
    
    az resource delete --ids $resource.id --yes
}

# Suppression du groupe de ressources une fois que toutes les ressources sont supprimées
az group delete --name $resourceGroupName --yes

Write-Host "Le groupe $resourceGroupName est supprimé"
