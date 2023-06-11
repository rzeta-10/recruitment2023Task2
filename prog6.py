import matplotlib.image as mpimg
import numpy as np

image = r'E:\Git\recruitment2023Task2\1134641.jpg'

# RGB(3 streams) matrix representation of the image
labrat = mpimg.imread(image)

# Define threshold values for typeA classification
threshold = (160, 160, 160)

# Initialize counters for typeA and typeB pixels
typeA_count = 0
typeB_count = 0

# Iterate over each pixel in the image
for row in labrat:
    for pixel in row:
        if all(pixel > threshold):
            typeA_count += 1
        else:
            typeB_count += 1

# Calculate the total number of pixels in the image
total_pixels = labrat.shape[0] * labrat.shape[1]

# Calculate the percentage of typeA and typeB pixels
typeA_percentage = (typeA_count / total_pixels) * 100
typeB_percentage = (typeB_count / total_pixels) * 100

# Print the percentages
print("Percentage of typeA pixels: {:.2f}%".format(typeA_percentage))
print("Percentage of typeB pixels: {:.2f}%".format(typeB_percentage))
