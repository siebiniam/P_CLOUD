<#
.NOTES
*****************************************************************************
ETML
Nom du script: List-ressource-siem.ps1
Auteur: Tecle Siem Biniam
Date: 15.11.23
*****************************************************************************
.SYNOPSIS
Créer un script Powershell pour supprimer les ressources d’un resource-group


.DESCRIPTION
Ce script PowerShell permet de supprimer des ressource d'un resource-groupe 
avec le nom du celui-ci.

#>

# Connexion à votre compte Azure (si ce n'est pas déjà fait)
az login

# Récupération de la liste de toutes les ressources dans l'abonnement
$allResources = az resource list --output json | ConvertFrom-Json

# Affichage des informations sur chaque ressource
foreach ($resource in $allResources) {
    Write-Host "Nom de la ressource: $($resource.name)"
    Write-Host "Type de ressource: $($resource.type)"
    Write-Host "Groupe de ressources: $($resource.resourceGroup)"
    Write-Host "--------------------------"
}

