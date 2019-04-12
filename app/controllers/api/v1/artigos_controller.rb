module Api
	module V1
		class ArtigosController < ApplicationController
		
			# Listar todos os artigos
			def index
				artigos = Artigo.order('created_at DESC');
				render json: {status: 'SUCESSO', message:'Artigos carregados', data:artigos},status: :ok
			end  
			def show
				artigo = Artigo.find(params[:id])
				render json: {status: 'SUCESSO', message:'Artigo Carregado', data:artigo},status: :ok
			end 
			def create
				artigo = Artigo.new(article_params)
				if artigo.save
					render json: {status: 'SUCESSO', message:'Artigo Salvo', data:artigo},status: :ok
				else
					render json: {status: 'ERRO', message:'Artigo nao foi salvo', data:artigo.erros},status: :unprocessable_entity
				end
			end
			# Excluir artigo
			def destroy
				artigo = Artigo.find(params[:id])
				artigo.destroy
				render json: {status: 'SUCESSO', message:'Artigo Deletado', data:artigo},status: :ok
			end
			def update
				artigo = Artigo.find(params[:id])
				if artigo.update_attributes(article_params)
					render json: {status: 'SUCESSO', message:'Artigo atualizado', data:artigo},status: :ok
				else
					render json: {status: 'ERROR', message:'Artigo nao foi atualizado', data:artigo.erros},status: :unprocessable_entity
				end
end
			# Parametros aceitos
			private
			def article_params
				params.permit(:titulo, :corpo)
			end
		end
		
	end
end
