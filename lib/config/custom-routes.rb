# Here you can override or add to the pages in the core website

Rails.application.routes.draw do
  get '/help/downloads' => 'help#downloads',
    via: 'get',
    as: 'help_downloads'
end
