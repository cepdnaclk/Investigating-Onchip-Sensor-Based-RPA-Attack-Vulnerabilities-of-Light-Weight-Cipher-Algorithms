
ngdbuild -intstyle ise -dd _ngo -sd ipcore_dir -nt timestamp -uc Zturn.ucf -p xc7z020-clg400-1 "top.ngc" top.ngd

map -intstyle ise -p xc7z020-clg400-1 -w -logic_opt off -ol high -xe c -t 1 -xt 0 -register_duplication off -r 4 -mt off -ir off -pr off -lc off -power off -o top_map.ncd top.ngd top.pcf

par -w -intstyle ise -ol high -xe c -mt off top_map.ncd top.ncd top.pcf

bitgen -intstyle ise -f top.ut top.ncd