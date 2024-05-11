New-Variable -Name 'explorer.exe Process' -Value (Get-CimInstance Win32_Process -Filter "Name = 'explorer.exe'" | Sort-Object ProcessId | Select-Object -First 1)
New-Variable -Name 'explorer.exe Owner' -Value ((Invoke-CimMethod -InputObject ${explorer.exe Process} -MethodName GetOwner).User)
$iw7 = "C:\Users\${explorer.exe Owner}\OneDrive\Play\Quake\sp\Ironwail\iw7"
$iwbd = "C:\Users\${explorer.exe Owner}\OneDrive\Play\Quake\sp\Ironwail"

function Play-Ironwail {param ([string]$Game = 'adzero',[string]$Map = 'ad_grendel',[string]$Skill = '3') & "$iw7\ironwail.exe" -basedir "$($iwbd)" -game $Game +map $Map +skill $Skill}
function Play-Dwellv2 {& "$iw7\ironwail.exe" -basedir "$($iwbd)" -game 'dwellv2' +map 'start'}
function Play-RottingJam {& "$iw7\ironwail.exe" -basedir "$($iwbd)" -game 'rotj' +map 'start'}
function Play-FireBlueJam {& "$iw7\ironwail.exe" -basedir "$($iwbd)" -game 'fbj' +map 'start'}
function Play-ReMobilize1.0 {& "$iw7\ironwail.exe" -basedir "$($iwbd)" -game 'ReMobilize' +map 'start'}
function Play-ReMobilize1.1 {& "$iw7\ironwail.exe" -basedir "$($iwbd)" -game 'ReMobilize1.1' +map 'start'}
function Play-ReMobilizeJam {param ($Map = 'start') & "$iw7\ironwail.exe" -basedir "$($iwbd)" -game 'rmjam1' +map $Map}
function Play-Alkaline {& "$iw7\ironwail.exe" -basedir "$($iwbd)" -game 'alk1.2' +map 'start'}
function Play-CorruptionCatharsis {& "$iw7\ironwail.exe" -basedir "$($iwbd)" -game 'alk1.2' +map 'rt_alk0'}
function Play-Tainted {& "$iw7\ironwail.exe" -basedir "$($iwbd)" -game 'tainted' +map 'start'}
function Play-Mjolnir {& "$iw7\ironwail.exe" -basedir "$($iwbd)" -game 'mjolnir' +map 'start'}
function Play-OnlyYouCanPreventContainmentBreaches {& "$iw7\ironwail.exe" -basedir "$($iwbd)" -game 'copper' +map 'suzyctmt' +skill '3'}
function Play-WenlMine {& "$iw7\ironwail.exe" -basedir "$($iwbd)" -game 'copper' +map 'megad2lvl3' +skill '3'}
function Play-BogManHasHadEnough {& "$iw7\ironwail.exe" -basedir "$($iwbd)" -game 'copper' +map 'frogsbog' +skill '3'}
function Play-GrislyGrottos {& "$iw7\ironwail.exe" -basedir "$($iwbd)" -game 'sm226' +map 'start' +skill '3'}
function Play-BrutalistJam2 {& "$iw7\ironwail.exe" -basedir "$($iwbd)" -game 'qbj2' +map 'start' +skill '1'}
function Play-SnackPack3 {& "$iw7\ironwail.exe" -basedir "$($iwbd)" -game 'snack3' +map 'start' +skill '1'}
function Play-WhatLiesBehindV1.2 {& "$iw7\ironwail.exe" -basedir "$($iwbd)" -game 'copper' +map 'wlb' +skill '3'}
function Play-EmpireOfDisorderV3 {& "$iw7\ironwail.exe" -basedir "$($iwbd)" -game 'eod3.0' +map 'eod0' +skill '3'}
function Play-RealmOfTheLieutenant {& "$iw7\ironwail.exe" -basedir "$($iwbd)" -game 'lth' +map 'start' +skill '3'}
function Play-sm228 {& "$iw7\ironwail.exe" -basedir "$($iwbd)" -game 'sm228' +map 'start' +skill '3'}
function Play-ADTowerOfMinak {& "$iw7\ironwail.exe" -basedir "$($iwbd)" -game 'ad' +map 'ad_tower' +skill '3'}

${Quake switch Logic} = {
  switch ($Game) {
    {$_ -eq 'quake'}       {$Map = @('start','e1m1','e1m2','e1m3','e1m4','e1m5','e1m6','e1m7','e1m8','e2m1','e2m2','e2m3','e2m4','e2m5','e2m6','e2m7','e3m1','e3m2','e3m3','e3m4','e3m5','e3m6','e3m7','e4m1','e4m2','e4m3','e4m4','e4m5','e4m6','e4m7','e4m8','end','dm1','dm2','dm3','dm4','dm5','dm6');break;}  
    {$_ -eq 'hipnotic'}    {$Map = @('start','hip1m1','hip1m2','hip1m3','hip1m4','hip1m5','hip2m1','hip2m2','hip2m3','hip2m4','hip2m5','hip2m6','hip3m1','hip3m2','hip3m3','hip3m4','hipdm1','hipend');break;}  
    {$_ -eq 'rogue'}       {$Map = @('start','r1m1','r1m2','r1m3','r1m4','r1m5','r1m6','r1m7','r2m1','r2m2','r2m3','r2m4','r2m5','r2m6','r2m7','r2m8','ctf1','end');break;}  
    {$_ -eq 'dopa'}        {$Map = @('start','e5start','e5m1','e5m2','e5m3','e5m4','e5m5','e5m6','e5m7','e5sm1','e5sm2','e5dm','e5end','end');break;}  
    {$_ -eq 'mg1'}         {$Map = @('start','hub','mge1m1','mge1m2','mge1m3','mge2m1','mge2m2','mge3m1','mge3m2','mge4m1','mge4m2','mge5m1','mge5m2','mgend','horde1','horde2','horde3','horde4','horde5','horde6','horde7','mgdm1','mgdm2','mgdm3','mgdm4');break;}  
    {$_ -eq 'udob'}        {$Map = @('start','udob1','udob2','udob3','udob4','udob5','udob6','udob7');break;}   
    {$_ -eq 'jjj2'}        {$Map = @('start','jjj2_dfl','jjj2_eduardo','jjj2_eduardo2','jjj2_greenwood','jjj2_gw_x9','jjj2_hcm','jjj2_ish','jjj2_ish2','jjj2_juzley','jjj2_konig','jjj2_magnetbox','jjj2_omni','jjj2_plaw','jjj2_quasiotter','jjj2_shades','jjj2_wiedo');break;}    
    {$_ -eq 'spiritworld'} {$Map = @('start','elders1','elders2','elders3','elders4','elders5','elders6','elders7','elders8','elders9','eldersx','eldersend');break;}    
    {$_ -eq 'dwellv2'}     {$Map = @('start','d1end','d1m1','d1m2','d1m3','d1m4','d1m5','d1m6','d1m7','d1m8','d1m9','d2end','d2m1','d2m2','d2m3','d2m4','d2m5','d2m6','d2m7','d2m8','d2m9','dwelldm2','dwelldm3','dwelldm7');break;}   
    {$_ -eq 'arwop'}       {$Map = @('start','roman1','roman2','roman3');break;}  
    {$_ -eq 'dnq'}         {$Map = @('startduke');break;}  
    {$_ -eq 'ancient1.1'}  {$Map = @('ancient');break;}  
  }
}
function Play-ReloadJamv1.1 {& "$iw7\ironwail.exe" -basedir "$($iwbd)" -game 'reload1.1' +map 'start' +skill '3'; write "Visit Reload Magazine at 'https://reload-magazine.net/mapping-jam-2/' for more info."}
