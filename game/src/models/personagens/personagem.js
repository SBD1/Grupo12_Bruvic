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
}