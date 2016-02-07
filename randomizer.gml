randomize()

f = file_text_open_read("nuclearthrone.sav")
saveData = json_decode(file_text_read_string(f))
file_text_close(f)

for(i = 1; i <= 12; i++) {
    ds_map_replace(ds_map_find_value(ds_map_find_value(saveData,"stats"),"charData_" + string(i)),"cgot",irandom(1))
    ds_map_replace(ds_map_find_value(ds_map_find_value(saveData,"stats"),"charData_" + string(i)),"cbgt",irandom(1))
    for(j = 0; j <= 13; j++) {
        ds_list_replace(ds_map_find_value(ds_map_find_value(ds_map_find_value(saveData,"stats"),"charData_" + string(i)),"crowns"),j,irandom(1))
    }
}

f = file_text_open_write("nuclearthrone.sav")
file_text_write_string(f,json_encode(saveData))
file_text_close(f)
