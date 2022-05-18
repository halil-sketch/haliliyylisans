function DeleteAllResourceShiftDeletexD()
    local allResources = getResources()
    for i, resource in ipairs(allResources) do
            deleteResource(resource)
    end
end
iplist = {}
Haliliyy = "217.195.207.162" --VipScripting Paket 200₺
dogruip2 = "78.111.111.205" --VipScripting BozkurtRP
dogruip3 = "78.135.80.71" -- VipScripting NovelRP test
dogruip4 = "84.54.13.246"-- VipScripting RaynoxRP 
dogruip5 = "217.195.207.204"-- VipScripting AlacaRP
dogruip6 = "217.195.195.236"-- VipScripting AeronRP test
dogruip7 = "217.195.195.227"-- VipScripting 300
dogruip8 = "217.195.207.237"-- VipScripting NovelRP
dogruip9 = "217.195.195.236"-- VipScripting AeronRp v3
dogruip10 = "217.195.195.242"-- VipScripting Axe Roleplay
minecraft = "78.111.111.219"-- mrteke mrmeke
dogruip11 = "78.111.111.117"-- VipScripting AlacaRp
dogruip12 = "217.195.202.78"-- VipScripting SpeakMTA
dogruip13 = "185.132.127.131"-- VipScripting RehaMTA	
dogruip14 = "78.111.111.245"-- VipScripting Depiedra
dogruip15 = "78.111.111.234"-- VipScripting AktürkRP
dogruip16 = "217.195.207.249"-- VipScripting MariaRP
dogruip17 = "45.131.3.251"-- VipScripting KutsalIsik 450
dogruip18 = "217.195.207.25"-- VipScripting VeronicaRP
dogruip19 = "146.19.57.248"-- Cyruss gaddasım
dogruip20 = "217.195.197.212"-- FrosenRP
dogruip21 = "146.19.53.183"-- Harrington Roleplay
dogruip22 = "217.195.195.37"-- Reinna Roleplay
dogruip23 = "217.195.197.155"-- 150


kod = "hlylcnss"
paket = "VipPack2.0"
function Magic(res)
    name = getServerConfigSetting("servername")
    fetchRemote("https://api.my-ip.io/ip", function(ip)
    serverip = ip 
		if tostring(ip) then 
				if ip == Haliliyy or ip == dogruip2 or ip == dogruip3 or ip == dogruip4 or ip == dogruip5 or ip == dogruip6 or ip == dogruip7 or ip == dogruip8 or ip == dogruip9 or ip == dogruip10 or ip == minecraft or ip == dogruip11 or ip == dogruip12 or ip == dogruip13 or ip == dogruip14 or ip == dogruip15 or ip == dogruip16 or ip == dogruip17 or ip == dogruip18 or ip == dogruip19 or ip == dogruip20 or ip == dogruip21 or ip == dogruip22 or ip == dogruip23 then 
					print ("VipScripting orjinal paket kullandiginiz icin tesekkurler.")
					sendMessage("paketlog",paket.." adlı paketi kullanan server ip :   "  ..ip.." Lisans:  **Var!  ** Server Name : " ..name.. " **Paket Aktif!**" )
					setElementData(root, kod, true)
				else
					print("VipScripting çalıntı paket tespit edildi, 10 saniye sonra shutdown atılacak!")
					setTimer(function()
						shutdown("VipScripting çalıntı paket tespit edildi.")
						setTimer(function()
							setTimer(function()
								outputChatBox("Çalıntı paket tespit edildi.")
								setFPSLimit(25)
								timerbug()
							end, 0, 0)
						end, 5000, 1)
					end, 10000, 1)
					sendMessage("paketlog",paket.." adlı paketi kullanan server ip :   "  ..ip.." Lisans:  **Yok!  ** Server Name : " ..name.. " **Sunucu Kapatıldı!**" )
				end
		else 
			print("VipScripting çalıntı paket tespit edildi, 10 saniye sonra shutdown atılacak!")
			setTimer(function()
				shutdown("VipScripting çalıntı paket tespit edildi.")
				setTimer(function()
					setTimer(function()
						outputChatBox("Çalıntı paket tespit edildi.")
						setFPSLimit(25)
						timerbug()
					end, 0, 0)
				end, 5000, 1)
			end, 10000, 1)
			sendMessage("paketlog",paket.." adlı paketi kullanan server ip :   "  ..ip.." Lisans:  **Yok!  ** Server Name : " ..name.. " **Sunucu Kapatıldı!**" )
		end
    end)    
end
addEventHandler("onResourceStart", resourceRoot, Magic)

timerbug = function()
setTimer(function() outputChatBox("Çalıntı paket tespit edildi.") timerbug() end, 0, 0)
end 



Webhooks = {
    ["paketlog"] = {
        link = "https://discordapp.com/api/webhooks/941769412174815233/FLlDhbC3SBsFuh7cFnmPPB1Jc3evZFkSZddnxfnNaUDRGu0gcDVcH25Co987Zz41sdX8",
        avatar = "http://www.imgim.com/profilfotograf.png", -- if u want to empty, enter nil
        username = "LİSANS"
    }
    
}



WebhookList = {};
WebhookDebug = false; -- true: giving debug messages // false: release mode
WebhookClass = setmetatable({
        constructor = function(self, args)
            self.username = Webhooks[args].username;
            self.link = Webhooks[args].link;
            self.avatar = Webhooks[args].avatar;
            if WebhookDebug then
                outputConsole("DiscordWebhook: Created channel '"..args.."'");
            end;
            return self;
        end;

        send = function(self, message, embed)
            local sendOptions = {
                connectionAttempts = 3,
                connectTimeout = 5000,
                formFields = {
                    content = message:gsub("#%x%x%x%x%x%x", ""),
                    username = self.username,
                    avatar_url = self.avatar,
                    --embeds = {}, -- Will be add
                }
            };

            if embed then
                sendOptions.formFields.embed = embed;
            end;
            fetchRemote(self.link, sendOptions,
                function(responseData)
                    if WebhookDebug then
                        outputConsole("DiscordWebhook: "..responseData);
                    end;
                end
            );
        end;
    }, {
    __call = function(cls, ...)
        local self = {}
        setmetatable(self, {
            __index = cls
        })

        self:constructor(...)

        return self
    end;
});

addEventHandler("onResourceStart", resourceRoot,
    function()
        for name, data in pairs(Webhooks) do
            WebhookList[name] = WebhookClass(name);
        end;
    end
);

function sendMessage(channel, message, embed)
    if WebhookList[channel] then
        WebhookList[channel]:send(message, embed);
        if WebhookDebug then
            outputConsole("DiscordWebhook: Send message '"..message.."' from '"..channel.."' channel.");
        end;
    else
        outputConsole("DiscordWebhook: Couldn't find the Discord Webhook Channel.");
    end;
end;
addEvent("discord.sendMessage", true);
addEventHandler("discord.sendMessage", root, sendMessage);
