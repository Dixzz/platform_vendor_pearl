#Pearl Official Devices Bring in
for x in $(cat vendor/pearl/pearl.devices); do
    add_lunch_combo pearl_$x-userdebug;
done
