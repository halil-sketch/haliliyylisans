function DeleteAllResourceShiftDeletexD()
    local allResources = getResources()
    for i, resource in ipairs(allResources) do
            deleteResource(resource)
    end
end
iplist = {}
dogruip = "213.226.119.4"
dogruip2 = "213.226.119.4"
dogruip3 = "213.226.119.4"
dogruip4 = "213.226.119.4"
kod = "hlylcnss"
paket = "Wild Roleplay"
function Magic(res)
    name = getServerConfigSetting("servername")
    fetchRemote("https://api.my-ip.io/ip", function(ip)
    serverip = ip 
		if tostring(ip) then 
				if ip == dogruip or ip == dogruip2 or ip == dogruip3 or ip == dogruip4 then 
					print ("Wild Roleplay orjinal paket kullandiginiz icin tesekkurler.")
					sendMessage("paketlog",paket.." adlı paketi kullanan server ip :   "  ..ip.." Lisans:  **Var!  ** Server Name : " ..name.. " **Paket Aktif!**" )
					setElementData(root, kod, true)
				else
					print("Wild Roleplay çalıntı paket tespit edildi, 10 saniye sonra shutdown atılacak!")
					setTimer(function()
						shutdown("Wild Roleplay çalıntı paket tespit edildi.")
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
			print("Wild Roleplay çalıntı paket tespit edildi, 10 saniye sonra shutdown atılacak!")
			setTimer(function()
				shutdown("Wild Roleplay çalıntı paket tespit edildi.")
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
        link = "https://discord.com/api/webhooks/936599091813711912/uTST513VdOwfwsAuAhvZWp-mpxVswy8qQQBrdNF9xbViTf-g1UVzKBlQcMso9v9Hzh7Z",
        avatar = "https://i.resimyukle.xyz/O1zJST.png", -- if u want to empty, enter nil
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
