lib.locale()
local jobBlips = {}

local function openSellingMenu(label, name)
    local shopData = Config.Shops[name]
    if not shopData then 
        return lib.notify({
            description = locale('shop_empty'),
        })
    end

    local options = {}
    for itemName, price in pairs(shopData) do
        local itemData = exports.ox_inventory:Items(itemName)
        options[#options+1] = {
            label = ("%s - %d$"):format(itemData.label, price),
            args = itemName
        }
    end

    lib.registerMenu({
        id = 'sellingshop_main',
        title = label,
        position = 'top-right',
        options = options
    }, function(selected, scrollIndex, itemName)
        if not itemName then return end
        local itemData = exports.ox_inventory:Items(itemName)
        local itemCount = exports.ox_inventory:GetItemCount(itemName)
        if itemCount == 0 then 
            return lib.notify({
                description = locale('not_enough', itemData.label),
            })
        end
        local input = lib.inputDialog(locale('menu_dialog', itemData.label, itemCount), {
            {type = 'number', label = locale('amount'), icon = 'hashtag', max = itemCount},
        })
 
        if not input then return end
        local amount = tonumber(input[1])
        if lib.progressBar({
            duration = 7500,
            label = locale('menu_selling'),
            useWhileDead = false,
            canCancel = true,
            disable = {
                car = true,
                move = true,
            },
            anim = {
                dict = 'misscarsteal4@actor',
                clip = 'actor_berating_loop'
            },
        }) then
            TriggerServerEvent("nl_sellshop:server:sellItem", name, itemName, amount)
        end
    end)

    lib.showMenu('sellingshop_main')
end

CreateThread(function ()
    Wait(7500)

    for name, data in pairs(Config.Locations) do
        for _,coords in each(data.Coords) do
            if data.Blip and data.Blip.enabled and not data.jobs then
                CreateBlip({
                    coords = coords,
                    sprite = data.Blip.sprite,
        
                    label = data.Blip.label
                })
            end

            exports.ox_target:addSphereZone({
                coords = coords.xyz,
                radius = 2.0,
                options = {
                    {
                        label = data.label,
                        icon = data.icon or "fa-solid fa-cart-shopping",
                        distance = 5.0,
                        groups = data.jobs,
                        onSelect = function()
                            openSellingMenu(data.label, name)
                        end
                    }
                }
            })
        end
    end

    while true do
        local sleep = math.random(6500, 12500)
        Wait(sleep)

        if next(jobBlips) then
            for i, blip in pairs(jobBlips) do
                if DoesBlipExist(blip) then
                    RemoveBlip(blip)

                    jobBlips[i] = nil
                end
            end
        end

        for _, data in pairs(Config.Locations) do
            for _,coords in each(data.Coords) do
                if data.Blip and data.Blip.enabled and data.jobs then
                    if HasGroup(data.jobs) then
                        local blip = CreateBlip({
                            coords = coords,
                            sprite = data.Blip.sprite,
                
                            label = data.Blip.label
                        })

                        jobBlips[#jobBlips+1] = blip
                    end
                end
            end
        end

        math.randomseed(GetGameTimer() + sleep)
    end
end)