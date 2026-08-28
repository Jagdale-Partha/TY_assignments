"""
visualizer.py - Reusable image visualization helper functions for computer vision experiments.
"""

from typing import List, Optional, Tuple, Union
import cv2
import matplotlib.pyplot as plt
import numpy as np


def show_image(
    image: np.ndarray,
    title: Optional[str] = None,
    cmap: Optional[str] = None,
    figsize: Tuple[int, int] = (6, 6),
) -> None:
    """Displays a single image using matplotlib with automatic color conversion if needed."""
    plt.figure(figsize=figsize)
    if len(image.shape) == 3 and image.shape[2] == 3 and cmap is None:
        # Assuming BGR OpenCV format if 3-channel
        plt.imshow(cv2.cvtColor(image, cv2.COLOR_BGR2RGB))
    elif len(image.shape) == 2:
        plt.imshow(image, cmap=cmap or "gray")
    else:
        plt.imshow(image, cmap=cmap)

    if title:
        plt.title(title)
    plt.axis("off")
    plt.tight_layout()
    plt.show()


def compare_images(
    images: List[np.ndarray],
    titles: Optional[List[str]] = None,
    cols: int = 2,
    figsize: Optional[Tuple[int, int]] = None,
) -> None:
    """Displays a list of images side-by-side in a grid."""
    n = len(images)
    rows = (n + cols - 1) // cols
    if figsize is None:
        figsize = (cols * 5, rows * 4)

    fig, axes = plt.subplots(rows, cols, figsize=figsize)
    axes = np.array(axes).reshape(-1)

    for idx in range(len(axes)):
        if idx < n:
            img = images[idx]
            if len(img.shape) == 3 and img.shape[2] == 3:
                axes[idx].imshow(cv2.cvtColor(img, cv2.COLOR_BGR2RGB))
            elif len(img.shape) == 2:
                axes[idx].imshow(img, cmap="gray")
            else:
                axes[idx].imshow(img)

            if titles and idx < len(titles):
                axes[idx].set_title(titles[idx])
            axes[idx].axis("off")
        else:
            axes[idx].axis("off")

    plt.tight_layout()
    plt.show()


def plot_histogram(
    image: np.ndarray,
    title: str = "Image Histogram",
    figsize: Tuple[int, int] = (8, 4),
) -> None:
    """Plots grayscale or RGB channel histograms."""
    plt.figure(figsize=figsize)
    if len(image.shape) == 2:
        plt.hist(image.ravel(), bins=256, range=[0, 256], color="black", alpha=0.7)
        plt.xlabel("Pixel Intensity")
        plt.ylabel("Frequency")
    elif len(image.shape) == 3:
        colors = ("b", "g", "r")
        for i, col in enumerate(colors):
            hist = cv2.calcHist([image], [i], None, [256], [0, 256])
            plt.plot(hist, color=col)
            plt.xlim([0, 256])
        plt.xlabel("Pixel Intensity")
        plt.ylabel("Frequency")
    plt.title(title)
    plt.grid(True, linestyle="--", alpha=0.5)
    plt.tight_layout()
    plt.show()
