class GossipsController < ApplicationController
  before_action :authenticate_user, except: [:index]
  # View a list of gossips
  def index
    @gossips = Gossip.all

    # Méthode qui récupère tous les potins et les envoie à la view index (index.html.erb) pour affichage
  end

  def show
    @gossip = Gossip.find(params[:id])
    @comment = Comment.new
    @comments = @gossip.comments
    # Méthode qui récupère le potin concerné et l'envoie à la view show (show.html.erb) pour affichage
  end

  def new
    @gossip = Gossip.new(title: "", content: "", user: User.last)
    # Méthode qui crée un potin vide et l'envoie à une view qui affiche le formulaire pour 'le remplir' (new.html.erb)
  end

def create
    @gossip = Gossip.new(user: User.first, title: params[:title], content: params[:content])

    if @gossip.save      
      redirect_to "/"
      flash[:success] = "Le gossip a bien été créé!"
    else
      flash[:error] = "Le gossip n'a pas un format valide, merci de le saisir à nouveau"
      render :new
      
    end
  end

  def edit
    @gossip = Gossip.find(params[:id])

    # Méthode qui récupère le potin concerné et l'envoie à la view edit (edit.html.erb) pour affichage dans un formulaire d'édition

  end

  def update
    @gossip = Gossip.find(params[:id])
    if @gossip.update(user: User.first, title: params[:title], content: params[:content])
      redirect_to "/"
      flash[:success] = "Le gossip a bien été modifié!"
    else
      flash[:error] = "Le gossip n'a pas un format valide, merci de le saisir à nouveau"
      render :edit
    end
  end

  def destroy
    Gossip.find(params[:id]).delete
    redirect_to gossips_path
  end
end