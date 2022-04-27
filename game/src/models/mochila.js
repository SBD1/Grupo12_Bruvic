
module.exports = class Mochila  { 

    static usoMochila(items){
        let sum = 0;

        items.forEach(element => {
          sum += element.peso;
        });
        return sum;
    }

    static showCapacityUse(items, capacidade){
        let sum = Mochila.usoMochila(items);
        return `A capacidade da sua mochila sendo utilizada é ${sum}/${capacidade}`;
    }
}