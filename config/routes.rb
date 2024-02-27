# frozen_string_literal: true

Rails.application.routes.draw do
  put '/billet_payments/:id/cancel', to: 'billet_payments#cancel'

  resources :customers, only: %i[new create]

  resources :addresses, only: %i[new create]

  resources :billet_payments
end
