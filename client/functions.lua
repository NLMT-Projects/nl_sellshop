function CreateBlip(data)
    if not data then return end
    local blip = AddBlipForCoord(data.coords.x, data.coords.y, data.coords.z)
    SetBlipSprite(blip, data.sprite)
    SetBlipDisplay(blip, data.display or 4)
    SetBlipScale(blip, data.scale or 0.6)
    SetBlipColour(blip, data.color or 4)
    SetBlipAsShortRange(blip, data.shortRange or true)
    BeginTextCommandSetBlipName("STRING")
    AddTextComponentString(data.label)
    EndTextCommandSetBlipName(blip)
end