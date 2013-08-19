package ia.menu;

/**
 * Created with IntelliJ IDEA.
 * User: francisco
 * Date: 23/07/13
 * Time: 18:14
 * To change this template use File | Settings | File Templates.
 */
public class Menu {
    private Item[] items;

    public Menu(int indiceAtual) {
        items = new Item[4];
        items[Intems.PRINCIPAL]=new Item("Principal","/");
        items[Intems.DEAMBULAR]=new Item("Deambular","/deambular-1");
        items[Intems.TLU]=new Item("Tlu","/tlu-1");
        items[Intems.PROCURA]=new Item("Procura","/procuraLargura");

        items[indiceAtual].setAtual(true);
    }

    public Item[] getItems() {
        return items;
    }
}
