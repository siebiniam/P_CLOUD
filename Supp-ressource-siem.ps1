<#
.NOTES
*****************************************************************************
ETML
Nom du script: Supp-ressource-siem.ps1
Auteur: Tecle Siem Biniam
Date: 15.11.23
*****************************************************************************
.SYNOPSIS
Créer un script Powershell pour supprimer les ressources d’un resource-group


.DESCRIPTION
Ce script PowerShell permet de supprimer des ressource d'un resource-groupe 
avec le nom du celui-ci.

#>

# *****************************************************************************

# Remplacez ces valeurs par les vôtres
$resourceGroupName = "NomDuResourceGroup"
$location = "Switzerland North"

# Connexion à votre compte Azure
az login

# Récupération de la liste des ressources dans le groupe de ressources
$resources = Get-AzResource -ResourceGroupName $resourceGroupName

# Suppression de chaque ressource
foreach ($resource in $resources) {
    $resourceName = $resource.ResourceName
    $resourceType = $resource.ResourceType

    Write-Host "Suppression de la ressource : $resourceName de type $resourceType"
    
    Remove-AzResourceGroup -Name $resourceGroupName -Force
    
}

Write-Host "le groupe $resourceGroupName est supprimée"