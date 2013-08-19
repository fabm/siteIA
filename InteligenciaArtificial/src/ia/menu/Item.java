package ia.menu;

/**
 * Created with IntelliJ IDEA.
 * User: francisco
 * Date: 24/07/13
 * Time: 03:08
 * To change this template use File | Settings | File Templates.
 */
public class Item {
    private String label;
    private String link;
    private boolean atual;

    public Item(String label, String link) {
        this.label = label;
        this.link = link;
        atual = false;
    }
    public boolean isAtual() {
        return atual;
    }

    public void setAtual(boolean atual) {
        this.atual = atual;
    }

    public String getLabel() {
        return label;
    }

    public void setLabel(String label) {
        this.label = label;
    }

    public String getLink() {
        return link;
    }

    public void setLink(String link) {
        this.link = link;
    }
}
