package imageswitcher;

public class ImageBean {
    private String[] images = {"image1.jpg", "image2.jpg", "image3.jpg","image4.jpg"};
    private int currentIndex;

    public ImageBean() {
        currentIndex = 0;
    }

    public String getCurrentImage() {
        return images[currentIndex];
    }

    public int getCurrentIndex() {
        return currentIndex;
    }

    public void previous() {
        currentIndex--;
        if (currentIndex < 0) {
            currentIndex = images.length - 1;
        }
    }

    public void next() {
        currentIndex++;
        if (currentIndex >= images.length) {
            currentIndex = 0;
        }
    }
}
