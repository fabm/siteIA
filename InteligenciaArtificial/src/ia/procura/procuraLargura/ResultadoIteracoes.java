package ia.procura.procuraLargura;

import ia.nos.LeitorHierarquico;
import ia.nos.No;

import java.util.ArrayList;

/**
 * Created with IntelliJ IDEA.
 * User: francisco
 * Date: 07/08/13
 * Time: 08:07
 * To change this template use File | Settings | File Templates.
 */
public class ResultadoIteracoes {
    public ArrayList<ArrayList<CidadePL>> iteracoes = new ArrayList<ArrayList<CidadePL>>();
    public LeitorHierarquico<CidadePL> leitor;

    public ResultadoIteracoes() {
        CidadePL arad = new CidadePL("Arad", 0);

        CidadePL zerind = arad.add("Zerind", 75);
        CidadePL timisoara = arad.add("Timisoara", 118);
        CidadePL sibiu = arad.add("Sibiu", 140);

        CidadePL oradea = zerind.add("Oradea", 71);
        CidadePL logoj = timisoara.add("Lugoj", 111);
        CidadePL fagares = sibiu.add("Fagares", 99);
        CidadePL rimneuVilcea = sibiu.add("Rimneu Vilcea", 80);

        oradea.add(sibiu, 151);
        CidadePL mehadia = logoj.add("Mehadia", 70);
        CidadePL bucharest = fagares.add("Bucharest", 211);
        CidadePL craiova = rimneuVilcea.add("Craiova", 146);
        CidadePL pitesti = rimneuVilcea.add("Pitesti", 97);
        pitesti.add(bucharest, 101);
        CidadePL dobreta = mehadia.add("Dobreta", 75);
        craiova.add(pitesti, 138);

        dobreta.add(craiova, 120);
        arad = arad.copia();
        this.leitor = new LeitorHierarquico<CidadePL>(arad);

        //craiova.substituiCopias();

        // define iteracoes
        ArrayList<CidadePL> nivel = new ArrayList<CidadePL>();
        nivel.add(arad);
        arad.setIteracao(0);
        int i = 0;
        while (!nivel.isEmpty()) {
            i++;
            ArrayList<CidadePL> nl = new ArrayList<CidadePL>();
            for (CidadePL c : nivel) {
                if (c.getFCidades() != null) {
                    for (No<CidadePL> sub : c.getFCidades()) {
                        nl.add(sub.getElemento());
                        sub.getElemento().setIteracao(i);
                    }
                }
            }
            nivel = nl;
            this.iteracoes.add(nivel);
        }
    }

}
