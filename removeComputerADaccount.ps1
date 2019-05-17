$domains = (Get-ADForest).Domains
$creds = Get-Credential
cls
$Remove = {
	cls
	$name = read-host "Enter the computer name"
	foreach ($domain in $domains)
	{
		Get-ADComputer -Filter "name -eq '$name'" -Server $domain -Properties sid | select name, sid
		Get-ADComputer -Filter "name -eq '$name'" -Server $domain -Properties sid | Remove-ADComputer -Confirm -Credential $creds -Server $domain
	}
	.$Remove
}
&$Remove