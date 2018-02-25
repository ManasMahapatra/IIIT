import os
import sys

print (': V I D E O :')
print ("=====================")
format_choice = raw_input("Enter the video format you want to picturise:")
print "[*] Video format selected."
file_path = raw_input("Enter the path of the video file:")
if not os.path.exists(file_path):
     print "[-]The file does not exist."
     sys.exit(0)
if not format_choice in file_path:
     print ("[-]Invalid format selected.")
     sys.exit(0)
else:
     print ("[*]Video file detected. Initiating application...")
print ("Select Option: \n")
print ("[1] Read Video with desired dimension \n")
print ("[2] Convert Video to sequence of pictures \n")
choice = raw_input("choice >>> ")
if choice == "1":
    width = raw_input("Enter width of the player: \n")
    height = raw_input("Enter height of the player: \n")
    command_1 = "ffplay " + file_path + " -x " + width + " -y " + height
    print ("[*]Initiating video playback...")
    os.system(command_1)

elif choice == "2":
    fps = raw_input("Enter frames per second (where 1 means 1 picture per second and 1/60 means one picture per minute): ")
    command_2 = "ffmpeg -i " + file_path + " -vf fps=" + fps + " img%03d.jpg"
    print ("[*]Initiating Conversion...")
    os.system(command_2)

else:
    print("[-]Invalid Choice")
    sys.exit(0)
