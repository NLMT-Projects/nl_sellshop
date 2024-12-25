fx_version 'cerulean'
games { 'gta5' }

lua54 "yes"

author 'NLMT'
name 'nl_sellshop'

repository 'https://github.com/NLMT-Projects/nl_sellshop'
version '1.0.0'

shared_scripts {
    '@ox_lib/init.lua',
    'shared/**',
}

client_scripts {
    'client/**'
}

server_scripts {
    'server/**'
}

files {
    'locales/*.json'
}

dependencies {
    'ox_inventory',
    'ox_lib'
}