package ia.procura;

import ia.nos.No;

import java.util.ArrayList;
import java.util.Iterator;

/**
 * Created with IntelliJ IDEA.
 * User: francisco
 * Date: 30/07/13
 * Time: 15:12
 * To change this template use File | Settings | File Templates.
 */
public abstract class Cidade<T extends Cidade> implements No<T> {

    protected ArrayList<No<T>> cidades = null;
    private String nome;
    private int id;
    private static int contador = 0;

    public int getId() {
        return id;
    }

    protected void init(String nome) {
        this.nome = nome;
        this.id = Cidade.contador;
        Cidade.contador++;
    }

    protected ArrayList<No<T>> getCidades() {
        if (cidades == null) cidades = new ArrayList();
        return cidades;
    }

    public String getNome() {
        return nome;
    }

    @Override
    public Iterator<No<T>> getIterador() {
        if (cidades == null) return null;
        return cidades.iterator();
    }
}
