module.exports = class Personagem  {
    constructor(id, vida, nome, destreza, forca, 
                constituicao, carisma, sabedoria, inteligencia, montante,
                raca=null, classe=null, classe_de_armadura=null, experiencia=null, nivel=null){

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
    }
}