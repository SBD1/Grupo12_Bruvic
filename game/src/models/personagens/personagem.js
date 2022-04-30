const clui = require('clui'),
clc = require('cli-color'),
Line = clui.Line;

module.exports = class Personagem  {
    constructor(id, vida, nome, destreza, forca, 
                constituicao, carisma, sabedoria, inteligencia, montante,
                raca=null, classe=null, classe_de_armadura=null, experiencia=null, 
                nivel=null, habilidades=[]){

        // mandatory fields
        this.id = id
        this.vida = vida
        this.nome = nome
        this.destreza = destreza
        this.forca = forca
        this.constituicao = constituicao
        this.carisma = carisma
        this.sabedoria = sabedoria
        this.inteligencia = inteligencia
        this.montante = montante

        // optional fields
        this.nivel = nivel
        this.experiencia = experiencia
        this.classe_de_armadura = classe_de_armadura

        this.raca = raca
        this.classe = classe

        this.habilidades = habilidades 

    }

    setMochilaInfo(capacidadeMochila=null, idMochila=null){
        this.capacidadeMochila = capacidadeMochila
        this.idMochila = idMochila
    }

    setNewHabilidade(habilidade){
        const isNewHabilidade = this.habilidades.filter(_habilidade => habilidade.nome === _habilidade.nome).length === 0;
        if(isNewHabilidade) this.habilidades.push(habilidade)
       
    }

    static cabecalhoTabela(){
        return new Line()
          .padding(2)
          .column('Nome', 30, [clc.cyan])
          .column('Classe', 10, [clc.cyan])
          .column('Raça', 10, [clc.cyan])
          .fill();
     }
 
     visualizarEmLinha(){
 
         return new Line()
         .padding(2)
         .column(this.nome, 30, [clc.cyan])
         .column(this.raca, 10, [clc.cyan])
         .column(this.classe, 10, [clc.cyan])
         .fill();
     }
}