import matplotlib.image as mpimg
import matplotlib.pyplot as plt
import numpy as np

def convert_to_bw(image, brightness_level):
    # Extract RGB channels
    red_channel = image[:, :, 0]
    green_channel = image[:, :, 1]
    blue_channel = image[:, :, 2]
    
    # Calculate brightness for each pixel
    brightness = (0.21 * red_channel + 0.72 * green_channel + 0.07 * blue_channel) / 3
    
    # Create a binary mask based on the brightness level
    mask = np.where(brightness >= brightness_level, 0, 1)
    
    # Apply the mask to each channel to convert to black and white
    bw_image = np.zeros_like(image)
    bw_image[:, :, 0] = red_channel * mask
    bw_image[:, :, 1] = green_channel * mask
    bw_image[:, :, 2] = blue_channel * mask
    
    return bw_image

image_path = 'file/path/image.jpg'  # Replace with the actual path to your image
brightness_level = 0.5  # Specify your desired brightness level (between 0 and 1)

# Load the image
labrat = mpimg.imread(image_path)

# Convert to black and white based on brightness level
bw_image = convert_to_bw(labrat, brightness_level)

# Display the black and white image
plt.imshow(bw_image, cmap='gray')
plt.axis('off')
plt.show()
