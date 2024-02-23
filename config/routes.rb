# frozen_string_literal: true

Rails.application.routes.draw do
  patch "/billet_payments/:id/cancel", to: "billet_payments#cancel"

  resources :billet_payments
end
