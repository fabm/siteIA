package ia.procura;

import ia.nos.No;

import java.util.ArrayList;
import java.util.Iterator;

/**
 * Created with IntelliJ IDEA.
 * User: francisco
 * Date: 05/08/13
 * Time: 06:25
 * To change this template use File | Settings | File Templates.
 */
public class CPL implements No<CPL>, Cloneable, Comparable<CPL> {
    public CPL(String nome, int distancia) {
        init(nome, distancia);
    }

    protected ArrayList<No<CPL>> cidades = null;
    protected String nome;
    protected int distancia;
    protected int id;
    protected static int contador = 0;

    public int getId() {
        return id;
    }

    private void init(String nome, int distancia) {
        this.nome = nome;
        this.distancia = distancia;
        this.id = CPL.contador;
        CPL.contador++;
    }

    public CPL add(String nome, int distancia) {
        CPL nova = new CPL(nome, distancia);
        getCidades().add(nova);
        return nova;
    }

    public void add(CPL cidade, int distancia) {
        try {
            CPL clone = (CPL) cidade.clone();
            clone.distancia = distancia;
            getCidades().add(clone);
        } catch (CloneNotSupportedException e) {
            System.out.println("Clone não é suportado");
        }
    }

    private ArrayList<No<CPL>> getCidades() {
        if (cidades == null) cidades = new ArrayList<No<CPL>>();
        return cidades;
    }

    public String getNome() {
        return nome;
    }

    @Override
    public Iterator<No<CPL>> getIterador() {
        if (cidades == null) return null;
        return cidades.iterator();
    }

    public int getDistancia() {
        return distancia;
    }

    @Override
    public CPL getElemento() {
        return this;
    }


    @Override
    public int compareTo(CPL c) {
        if (this.getDistancia() > c.getDistancia()) return 1;
        if (this.getDistancia() < c.getDistancia()) return -1;
        return 0;
    }


    public static ArrayList<ArrayList<CPL>> criaArvoreProcuraCega() {
        CPL arad = new CPL("Arad", 0);

        CPL zerind = arad.add("Zerind", 75);
        CPL timisoara = arad.add("Timisoara", 118);
        CPL sibiu = arad.add("Sibiu", 140);

        CPL oradea = zerind.add("Oradea", 71);
        CPL logoj = timisoara.add("Lugoj", 111);
        CPL fagares = sibiu.add("Fagares", 99);
        CPL rimneuVilcea = sibiu.add("Rimneu Vilcea", 80);

        oradea.add(sibiu, 151);
        CPL mehadia = logoj.add("Mehadia", 70);
        CPL bucharest = fagares.add("Bucharest", 211);
        CPL craiova = rimneuVilcea.add("Craiova", 146);
        CPL pitesti = rimneuVilcea.add("Pitesti", 97);
        pitesti.add(bucharest, 101);
        CPL dobreta = mehadia.add("Dobreta", 75);
        craiova.add(pitesti, 138);

        dobreta.add(craiova, 120);

        // define iteracoes

        ArrayList<ArrayList<CPL>> niveis = new ArrayList<ArrayList<CPL>>();
        ArrayList<CPL> nivel = new ArrayList<CPL>();
        nivel.add(arad);
        while (!nivel.isEmpty()) {
            ArrayList<CPL> nl = new ArrayList<CPL>();
            for(CPL c : nivel){
                for(No<CPL> sub:c.getCidades()){
                    nl.add(sub.getElemento());
                }
            }
            nivel = nl;
            niveis.add(nl);
        }
        return niveis;
    }
}
