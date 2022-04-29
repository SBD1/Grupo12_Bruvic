const { buildGameTitle } = require('../common'); 
const HabilidadeManager = require('../../models/habilidade/habilidade_manager'); 
const inquirer = require('inquirer');

const addHabilidadeToPersonagem = async (personagem) => {
    buildGameTitle(); 
    const allHabilidades = await getHabilidadesByClasse(personagem.classe); 
    const habilidadeSelected = await buildHabilidadeSelector(allHabilidades);
    await saveHabilidadeToPersonagem(habilidadeSelected, personagem); 
    return personagem;
}


const getHabilidadesByClasse = async (personagem_classe) => {
    let habilidades = []; 
    if(personagem_classe == 'Mago'){   
       habilidades = await  HabilidadeManager.getAllByTipo('Magia');
       return habilidades; 
    }

    if(personagem_classe == 'Clerigo'){
        curas = await  HabilidadeManager.getAllByTipo('Cura');
        truques = await  HabilidadeManager.getAllByTipo('Truque');
        return [...curas, ...truques]; 
    }
}

const buildHabilidadeSelector = async (allHabilidades) => {
    console.log('Escolha uma das habilidades disponíveis para sua classe.'); 
    console.log();
    allHabilidades.forEach((habilidade, i) => {
        console.log(`${i + 1}) ${habilidade.nome}`); 
    }); 
    const option = await getInputPrompt(allHabilidades.length); 
    return allHabilidades[option]; 
}

const getInputPrompt = async (limit) => {
    const { habilidadeOpt } = await inquirer.prompt([
        {
            name: 'habilidadeOpt',
            type: 'input',
            message: 'Escolha uma das habilidades disponíveis para sua classe:',
            validate: async function (value) {
                const check = parseInt(value);
                return (isNaN(check) || check<1 || check>limit) ?
                `A opção precisa ser um número entre 1 e ${limit}` : true;
            }
        }
    ]);   

    return Number(habilidadeOpt-1); 
}

const saveHabilidadeToPersonagem = async (habilidade, personagem) => {
    if(habilidade.tipo === 'Magia'){
        await HabilidadeManager.saveToMagoMagia(habilidade, personagem); 
    }
    if(habilidade.tipo === 'Cura'){
        await HabilidadeManager.saveToClerigoCura(habilidade, personagem); 
    }
    if(habilidade.tipo === 'Truque'){
        await HabilidadeManager.saveToMagoMagia(habilidade, personagem); 
    }
    personagem.setNewHabilidade(habilidade); 
}

module.exports = addHabilidadeToPersonagem;