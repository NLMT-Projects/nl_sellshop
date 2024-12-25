function HasGroup(client, groups)
    local type = type(groups)
    local player = exports.qbx_core:GetPlayer(client)
    if not player then return end

    for i = 1, #groups do
        if groups[i] == player.PlayerData.job.name then
            return true
        end
    end

    return false
end