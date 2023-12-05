<#
.NOTES
*****************************************************************************
ETML
Nom du script: List-ressource-siem.ps1
Auteur: Tecle Siem Biniam
Date: 5.12.23
*****************************************************************************
.SYNOPSIS
Créer un script Powershell pour lister les ressources d’un resource-group

.DESCRIPTION
Ce script PowerShell permet de lister les ressources d'un groupe de ressources
en utilisant son nom.

#>

# *****************************************************************************

# Demander à l'utilisateur d'entrer le nom du groupe de ressources
$resourceGroupName = Read-Host "Entrez le nom du groupe de ressources"

# Connexion à votre compte Azure 
az login

# Récupération de la liste des ressources dans le groupe de ressources choisie
$resourcesInGroup = az resource list --resource-group $resourceGroupName --output json | ConvertFrom-Json

# Affichage des informations sur chaque ressource
foreach ($resource in $resourcesInGroup) {
    Write-Host "Groupe de ressources: $($resource.resourceGroup)"
    Write-Host "Nom de la ressource: $($resource.name)"
    Write-Host "Type de ressource: $($resource.type)"
    Write-Host "--------------------------"
}

