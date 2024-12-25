function HasGroup(groups)
    local type = type(groups)
    local PlayerData = exports.qbx_core:GetPlayerData()

    for i = 1, #groups do
        if groups[i] == PlayerData.job.name then
            return true
        end
    end

    return false
end