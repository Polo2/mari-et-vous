class Registry < ApplicationRecord
  belongs_to :wedding
  belongs_to :user

  serialize :guests, Array

  before_validation :define_guests

  attr_writer :guest_names

  def guest_names
    guests.map{|g| g[:name]}
  end

   def define_guests
    ap "hey!"
    ap self
    ap @guest_names
    # je me casse si je ne veux pas passer ici (bien réfléchir aux situations) return if ...

    return unless @guest_names


    names_has_accepted = self.guests.select{|g| g[:presence]}.map{|g| g[:name] } # On récupère les noms de tous ceux qui avait déjà accepté
    final_guests = @guest_names.map{|g| {name: g, presence: names_has_accepted.include?(g)}}
    self.guests = final_guests

  end

end
