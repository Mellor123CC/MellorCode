local whitelistecheck = loadstring(game:HttpGet("https://raw.githubusercontent.com/Robojini/White-List/main/DataBase", true))()

userids = {
[3973824842] = true,
[3795008910] = true
}
return userids

if whitelistecheck[game:service('Players').LocalPlayer.UserId] then
  loadstring(game:HttpGet("https://raw.githubusercontent.com/Mellor123CC/MellorCode/main/mellorcode.lua"))()
else
  game:service('Players').LocalPlayer:Kick('Bruh')
end
