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

    # actual_guys = self.guys # je recupère ce que je connaissait déjà
    # final_guys  = actual_guys.select {|g| @guy_names.inlcude ? g[:name]} # on garde que les gens qui sont encore d'actualités
    # new_guys    = @guy_names.exept{|g| actual_guys.map{|gu| gu[:name]}.include? g} # on veut tous les nouveaux mecs
    # final_guys.merge!(new_guys.map{|g| {name: g, presence:false}})
    # self.guys = final_guys

    #=============================

    # actual_guests = self.guests
    # final_guests  = actual_guests.select {|g| @guest_names.inlcude ? g[:name]}
    # new_guests    = @guest_names.exept{|g| actual_guests.map{|gu| gu[:name]}.include? g}
    # final_guests.merge!(new_guests.map{|g| {name: g, presence:false}})
    # self.guests = final_guests


    names_has_accepted = self.guests.select{|g| g[:presence] == true}.map{|g| g[:name] } # On récupère les noms de tous ceux qui avait déjà accepté
    final_guests = @guest_names.map{|g| {name: g, presence: names_has_accepted.include?(g)}}
    self.guests = final_guests

  end

end
