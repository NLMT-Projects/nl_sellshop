lib.locale()

RegisterNetEvent("nl_sellshop:server:sellItem", function (index, itemName, amount)
    local client = source
    if not itemName or not amount then return end
    if not Config.Shops[index] or not Config.Shops[index][itemName] then return end
    local shopData = Config.Locations[index]
    if not shopData then return end

    if shopData.jobs and not HasGroup(client, shopData.jobs) then
        return
    end

    if not exports.ox_inventory:RemoveItem(client, itemName, amount) then
        local itemData = exports.ox_inventory:Items(itemName)
        TriggerClientEvent('ox_lib:notify', client, {
            description = locale('not_enough', itemData.label),
        })

        return
    end

    local soldAmount = Config.Shops[index][itemName] * amount
    exports.ox_inventory:AddItem(client, "money", soldAmount)
    TriggerClientEvent('ox_lib:notify', client, {
        description = locale('sold', soldAmount),
    })
end)