///@function layout_GHZ(collision plane, tile ID, cell x, cell y)
function layout_GHZ(_plane, _tile_ID, _tile_x, _tile_y){
	// Collision layouts for GHZ tiles (Used in the chunk viewer)
	switch(_tile_ID) {
		case 3:
		{
			tilemap_set(global.map_id[_plane],$101,_tile_x,_tile_y); _tile_x++;
			tilemap_set_mirrored(global.map_id[_plane],$117,_tile_x,_tile_y); _tile_x++;
			tilemap_set_mirrored(global.map_id[_plane],$116,_tile_x,_tile_y); _tile_x++;
			tilemap_set_mirrored(global.map_id[_plane],$115,_tile_x,_tile_y); _tile_x++;
			tilemap_set(global.map_id[_plane],$115,_tile_x,_tile_y); _tile_x++;
			tilemap_set(global.map_id[_plane],$116,_tile_x,_tile_y); _tile_x++;
			tilemap_set(global.map_id[_plane],$117,_tile_x,_tile_y); _tile_x++;
			tilemap_set(global.map_id[_plane],$101,_tile_x,_tile_y); _tile_x-=7; _tile_y++;
			repeat(7) { tilemap_set(global.map_id[_plane],$101,_tile_x,_tile_y); _tile_x++; }
			tilemap_set(global.map_id[_plane],$101,_tile_x,_tile_y);
		}
		break;
		//-------------------------------------------------------
		case 4:
		{
			tilemap_set(global.map_id[_plane],$101,_tile_x,_tile_y); _tile_x++;
			tilemap_set_mirrored(global.map_id[_plane],$117,_tile_x,_tile_y); _tile_x++;
			tilemap_set_mirrored(global.map_id[_plane],$116,_tile_x,_tile_y); _tile_x++;
			tilemap_set_mirrored(global.map_id[_plane],$115,_tile_x,_tile_y); _tile_x++;
			tilemap_set_mirrored(global.map_id[_plane],$115,_tile_x,_tile_y); _tile_x++;
			tilemap_set(global.map_id[_plane],$115,_tile_x,_tile_y); _tile_x++;
			tilemap_set(global.map_id[_plane],$116,_tile_x,_tile_y); _tile_x++;
			tilemap_set(global.map_id[_plane],$117,_tile_x,_tile_y); _tile_x-=7; _tile_y++;
			repeat(7) { tilemap_set(global.map_id[_plane],$101,_tile_x,_tile_y); _tile_x++; }
			tilemap_set(global.map_id[_plane],$101,_tile_x,_tile_y);
		}
		break;
		//-------------------------------------------------------
		case 5:
		{
			tilemap_set(global.map_id[_plane],$111,_tile_x+1,_tile_y+7);
		}
		break;
		//-------------------------------------------------------
		case 7:
		{
			tilemap_set(global.map_id[_plane],$101,_tile_x,_tile_y); _tile_x++;
			tilemap_set(global.map_id[_plane],$101,_tile_x,_tile_y); _tile_x++;
			tilemap_set(global.map_id[_plane],$101,_tile_x,_tile_y); _tile_x++;
			tilemap_set_mirrored(global.map_id[_plane],$11C,_tile_x,_tile_y); _tile_x++;
			tilemap_set_mirrored(global.map_id[_plane],$11B,_tile_x,_tile_y); _tile_x++;
			tilemap_set_mirrored(global.map_id[_plane],$11A,_tile_x,_tile_y); _tile_x++;
			tilemap_set_mirrored(global.map_id[_plane],$119,_tile_x,_tile_y); _tile_x-=6; _tile_y++;
			repeat(7) { tilemap_set(global.map_id[_plane],$101,_tile_x,_tile_y); _tile_x++; }
			tilemap_set_mirrored(global.map_id[_plane],$11E,_tile_x,_tile_y); _tile_y++;
			tilemap_set(global.map_id[_plane],$101,_tile_x,_tile_y);
		}
		break;
		//-------------------------------------------------------
		case 8:
		{
			_tile_y++;
			tilemap_set_mirrored(global.map_id[_plane],$11D,_tile_x,_tile_y); _tile_y++;
			tilemap_set(global.map_id[_plane],$101,_tile_x,_tile_y); _tile_x++;
			tilemap_set_mirrored(global.map_id[_plane],$11E,_tile_x,_tile_y); _tile_x++;
			tilemap_set_mirrored(global.map_id[_plane],$11D,_tile_x,_tile_y); _tile_x--; _tile_y++;
			tilemap_set(global.map_id[_plane],$101,_tile_x,_tile_y); _tile_x++;
			tilemap_set(global.map_id[_plane],$101,_tile_x,_tile_y); _tile_x++;
			tilemap_set_mirrored(global.map_id[_plane],$11C,_tile_x,_tile_y); _tile_x++;
			tilemap_set_mirrored(global.map_id[_plane],$11B,_tile_x,_tile_y); _tile_x++;
			tilemap_set_mirrored(global.map_id[_plane],$11A,_tile_x,_tile_y); _tile_x++;
			tilemap_set_mirrored(global.map_id[_plane],$119,_tile_x,_tile_y); _tile_x-=3; _tile_y++;
			repeat(4) { tilemap_set(global.map_id[_plane],$101,_tile_x,_tile_y); _tile_x++; }
			tilemap_set(global.map_id[_plane],$101,_tile_x,_tile_y); _tile_y++;
			tilemap_set(global.map_id[_plane],$101,_tile_x,_tile_y);
		}
		break;
		//-------------------------------------------------------
		case 9:
		{
			_tile_x+=2; _tile_y+=6;
			repeat(5) { tilemap_set(global.map_id[_plane],$101,_tile_x,_tile_y); _tile_x++; }
			tilemap_set(global.map_id[_plane],$101,_tile_x,_tile_y); _tile_x-=5; _tile_y++;
			repeat(5) { tilemap_set(global.map_id[_plane],$101,_tile_x,_tile_y); _tile_x++; }
			tilemap_set(global.map_id[_plane],$101,_tile_x,_tile_y);
		}
		break;
		//-------------------------------------------------------
		case 10:
		{
			_tile_y+=6;
			repeat(5) { tilemap_set(global.map_id[_plane],$101,_tile_x,_tile_y); _tile_x++; }
			tilemap_set(global.map_id[_plane],$101,_tile_x,_tile_y); _tile_x-=5; _tile_y++;
			repeat(5) { tilemap_set(global.map_id[_plane],$101,_tile_x,_tile_y); _tile_x++; }
			tilemap_set(global.map_id[_plane],$101,_tile_x,_tile_y);
		}
		break;
		//-------------------------------------------------------
		case 11:
		{
			_tile_y+=4;
			repeat(3) {tilemap_set(global.map_id[_plane],$101,_tile_x,_tile_y); _tile_x++;}
			tilemap_set_mirrored(global.map_id[_plane],$117,_tile_x,_tile_y); _tile_x++;
			tilemap_set_mirrored(global.map_id[_plane],$116,_tile_x,_tile_y); _tile_x++;
			tilemap_set_mirrored(global.map_id[_plane],$10A,_tile_x,_tile_y); _tile_x++;
			tilemap_set_mirrored(global.map_id[_plane],$109,_tile_x,_tile_y); _tile_x++;
			tilemap_set(global.map_id[_plane],$113,_tile_x,_tile_y); _tile_x-=7; _tile_y++;
			repeat(7) {tilemap_set(global.map_id[_plane],$101,_tile_x,_tile_y); _tile_x++;}
			tilemap_set(global.map_id[_plane],$101,_tile_x,_tile_y);
		}
		break;
		//-------------------------------------------------------
		case 12:
		{
			_tile_y+=4;
			tilemap_set(global.map_id[_plane],$113,_tile_x,_tile_y); _tile_x++;
			tilemap_set(global.map_id[_plane],$109,_tile_x,_tile_y); _tile_x++;
			tilemap_set(global.map_id[_plane],$10A,_tile_x,_tile_y); _tile_x++;
			tilemap_set(global.map_id[_plane],$116,_tile_x,_tile_y); _tile_x++;
			tilemap_set(global.map_id[_plane],$117,_tile_x,_tile_y); _tile_x++;
			repeat(2) { tilemap_set(global.map_id[_plane],$101,_tile_x,_tile_y); _tile_x++; }
			tilemap_set(global.map_id[_plane],$101,_tile_x,_tile_y); _tile_x-=7; _tile_y++;
			repeat(7) { tilemap_set(global.map_id[_plane],$101,_tile_x,_tile_y); _tile_x++; }
			tilemap_set(global.map_id[_plane],$101,_tile_x,_tile_y);
		}
		break;
		//-------------------------------------------------------
		case 14:
		{
			_tile_x+=4; _tile_y+=4;
			repeat(2) {
				tilemap_set(global.map_id[_plane],$001,_tile_x,_tile_y); _tile_x++;
				repeat(2) { tilemap_set(global.map_id[_plane],$101,_tile_x,_tile_y); _tile_x++; }
				tilemap_set(global.map_id[_plane],$101,_tile_x,_tile_y); _tile_x-=3; _tile_y++;
			} _tile_x-=4;
			tilemap_set(global.map_id[_plane],$001,_tile_x,_tile_y); _tile_x++;
			repeat(3) { tilemap_set(global.map_id[_plane],$101,_tile_x,_tile_y); _tile_x++; }
			tilemap_set(global.map_id[_plane],$001,_tile_x,_tile_y); _tile_x-=4; _tile_y++;
			tilemap_set(global.map_id[_plane],$001,_tile_x,_tile_y); _tile_x++;
			repeat(2) { tilemap_set(global.map_id[_plane],$101,_tile_x,_tile_y); _tile_x++; }
			tilemap_set(global.map_id[_plane],$101,_tile_x,_tile_y);
		}
		break;
		//-------------------------------------------------------
		case 15:
		{
			tilemap_set(global.map_id[_plane],$101,_tile_x,_tile_y); _tile_x++;
			tilemap_set_mirrored(global.map_id[_plane],$117,_tile_x,_tile_y); _tile_x++;
			tilemap_set_mirrored(global.map_id[_plane],$117,_tile_x,_tile_y); _tile_x++;
			tilemap_set(global.map_id[_plane],$117,_tile_x,_tile_y); _tile_x++;
			repeat(3) { tilemap_set(global.map_id[_plane],$101,_tile_x,_tile_y); _tile_x++; }
			tilemap_set(global.map_id[_plane],$101,_tile_x,_tile_y); _tile_x-=7; _tile_y++;
			repeat(7) { tilemap_set(global.map_id[_plane],$101,_tile_x,_tile_y); _tile_x++; }
			tilemap_set(global.map_id[_plane],$101,_tile_x,_tile_y);
		}
		break;
		//-------------------------------------------------------
		case 16:
		{
			tilemap_set(global.map_id[_plane],$001,_tile_x,_tile_y);
		}
		break;
		//-------------------------------------------------------
		case 17:
		{
			_tile_x+=6;
			tilemap_set_mirrored(global.map_id[_plane],$111,_tile_x,_tile_y); _tile_x++;
			tilemap_set(global.map_id[_plane],$111,_tile_x,_tile_y); _tile_x-=3; _tile_y++;
			tilemap_set(global.map_id[_plane],$001,_tile_x,_tile_y); _tile_x++;
			repeat(2) { tilemap_set(global.map_id[_plane],$101,_tile_x,_tile_y); _tile_x++; }
			tilemap_set(global.map_id[_plane],$101,_tile_x,_tile_y); _tile_x-=3; _tile_y++;
			tilemap_set(global.map_id[_plane],$001,_tile_x,_tile_y);
			tilemap_set(global.map_id[_plane],$101,_tile_x+1,_tile_y); _tile_y++;
			tilemap_set(global.map_id[_plane],$001,_tile_x,_tile_y); _tile_x-=4; _tile_y++
			repeat(4) { tilemap_set(global.map_id[_plane],$101,_tile_x,_tile_y); _tile_x++; }
			tilemap_set(global.map_id[_plane],$001,_tile_x,_tile_y); _tile_x-=4; _tile_y++;
			repeat(3) { tilemap_set(global.map_id[_plane],$101,_tile_x,_tile_y); _tile_x++; }
			tilemap_set(global.map_id[_plane],$101,_tile_x,_tile_y);
		}
		break;
		//-------------------------------------------------------
		case 18:
		{
			_tile_x+=3;
			tilemap_set(global.map_id[_plane],$111,_tile_x,_tile_y); _tile_x++;
			tilemap_set(global.map_id[_plane],$112,_tile_x,_tile_y); _tile_x++;
			tilemap_set_mirrored(global.map_id[_plane],$112,_tile_x,_tile_y); _tile_x++;
			tilemap_set_mirrored(global.map_id[_plane],$111,_tile_x,_tile_y); _tile_x-=6; _tile_y++;
			repeat(7) { tilemap_set(global.map_id[_plane],$101,_tile_x,_tile_y); _tile_x++; }
			tilemap_set(global.map_id[_plane],$101,_tile_x,_tile_y); _tile_x-=7; _tile_y++;
			repeat(7) { tilemap_set(global.map_id[_plane],$101,_tile_x,_tile_y); _tile_x++; }
			tilemap_set(global.map_id[_plane],$101,_tile_x,_tile_y);
		}
		break;
		//-------------------------------------------------------
		case 21:
		{
			_tile_x+=4;
			repeat(7) { tilemap_set(global.map_id[_plane],$001,_tile_x,_tile_y); _tile_y++; }
			repeat(3) { tilemap_set(global.map_id[_plane],$001,_tile_x,_tile_y); _tile_x++; }
			tilemap_set(global.map_id[_plane],$001,_tile_x,_tile_y);
		}
		break;
		//-------------------------------------------------------
		case 22:
		{
			_tile_y+=7;
			repeat(7) { tilemap_set(global.map_id[_plane],$001,_tile_x,_tile_y); _tile_x++; }
			repeat(7) { tilemap_set(global.map_id[_plane],$001,_tile_x,_tile_y); _tile_y--; }
			tilemap_set(global.map_id[_plane],$001,_tile_x,_tile_y);
		}
		break;
		//-------------------------------------------------------
		case 23:
		case 24:
		case 51:
		case 52:
		case 168:
		case 186:
		case 195:
		case 196:
		{
			_tile_y+=4;
			repeat(2) {
				repeat(7) { tilemap_set(global.map_id[_plane],$101,_tile_x,_tile_y); _tile_x++; }
				tilemap_set(global.map_id[_plane],$101,_tile_x,_tile_y); _tile_x-=7; _tile_y++; }
		}
		break;
		//-------------------------------------------------------
		case 27:
		{
			_tile_x+=6;
			tilemap_set(global.map_id[_plane],	$96,_tile_x,_tile_y); _tile_x++;
			tilemap_set(global.map_id[_plane],	$001,_tile_x,_tile_y); _tile_x--; _tile_y++;

			tilemap_set(global.map_id[_plane],	$95,_tile_x,_tile_y); _tile_x++;
			tilemap_set(global.map_id[_plane],	$001,_tile_x,_tile_y); _tile_x-=2; _tile_y++;

			tilemap_set(global.map_id[_plane],	$94,_tile_x,_tile_y); _tile_x++;
			tilemap_set(global.map_id[_plane],	$001,_tile_x,_tile_y); _tile_x++;
			tilemap_set(global.map_id[_plane],	$001,_tile_x,_tile_y); _tile_x-=5; _tile_y++;

			tilemap_set(global.map_id[_plane],	$7B,_tile_x,_tile_y); _tile_x++;
			tilemap_set(global.map_id[_plane],	$92,_tile_x,_tile_y); _tile_x++;
			tilemap_set(global.map_id[_plane],	$93,_tile_x,_tile_y); _tile_x++;
			tilemap_set(global.map_id[_plane],	$001,_tile_x,_tile_y); _tile_x++;
			tilemap_set(global.map_id[_plane],	$001,_tile_x,_tile_y); _tile_x-=6; _tile_y++;

			repeat(2){
			tilemap_set(global.map_id[_plane],	$101,_tile_x,_tile_y); _tile_x++;
			}
			repeat(3){
			tilemap_set(global.map_id[_plane],	$001,_tile_x,_tile_y); _tile_x++;
			}
			tilemap_set(global.map_id[_plane],	$001,_tile_x,_tile_y); _tile_x-=5; _tile_y++;

			tilemap_set(global.map_id[_plane],	$101,_tile_x,_tile_y); _tile_x++;
			tilemap_set(global.map_id[_plane],	$101,_tile_x,_tile_y);
		}
		break;
		//-------------------------------------------------------
		case 28:
		{
			tilemap_set_mirrored(global.map_id[_plane],$117,_tile_x,_tile_y); _tile_x++
			tilemap_set_mirrored(global.map_id[_plane],$116,_tile_x,_tile_y); _tile_x++
			tilemap_set(global.map_id[_plane],$116,_tile_x,_tile_y); _tile_x++
			tilemap_set(global.map_id[_plane],$117,_tile_x,_tile_y); _tile_x++
			repeat(3) { tilemap_set(global.map_id[_plane],$101,_tile_x,_tile_y); _tile_x++; }
			tilemap_set(global.map_id[_plane],$101,_tile_x,_tile_y); _tile_x-=7; _tile_y++;
			repeat(7) { tilemap_set(global.map_id[_plane],$101,_tile_x,_tile_y); _tile_x++; }
			tilemap_set(global.map_id[_plane],$101,_tile_x,_tile_y);
		}
		break;
		//-------------------------------------------------------
		case 29:
		{
			_tile_x+=6; _tile_y+=6;
			tilemap_set(global.map_id[_plane],$001,_tile_x,_tile_y);
			tilemap_set(global.map_id[_plane],$101,_tile_x+1,_tile_y);
			tilemap_set(global.map_id[_plane],$001,_tile_x,_tile_y+1);
			tilemap_set(global.map_id[_plane],$101,_tile_x+1,_tile_y+1);
		}
		break;
		//-------------------------------------------------------
		case 30:
		{
			_tile_x+=2; _tile_y+=4;
			repeat(2)
			{
				tilemap_set(global.map_id[_plane],$001,_tile_x,_tile_y); _tile_x++;
				repeat(4) {tilemap_set(global.map_id[_plane],$101,_tile_x,_tile_y); _tile_x++;}
				tilemap_set(global.map_id[_plane],$101,_tile_x,_tile_y); _tile_x-=5; _tile_y++;
			} _tile_x-=2;
			repeat(2) {tilemap_set(global.map_id[_plane],$101,_tile_x,_tile_y); _tile_x++;}
			tilemap_set(global.map_id[_plane],$001,_tile_x,_tile_y); _tile_x-=2; _tile_y++;
			tilemap_set(global.map_id[_plane],$101,_tile_x,_tile_y);
			tilemap_set(global.map_id[_plane],$101,_tile_x+1,_tile_y);
		}
		break;
		//-------------------------------------------------------
		case 31:
		{
			tilemap_set(global.map_id[_plane],$101,_tile_x,_tile_y); _tile_x++;
			tilemap_set_mirrored(global.map_id[_plane],$117,_tile_x,_tile_y); _tile_x++;
			tilemap_set_mirrored(global.map_id[_plane],$116,_tile_x,_tile_y); _tile_x++;
			tilemap_set(global.map_id[_plane],$116,_tile_x,_tile_y); _tile_x++;
			tilemap_set(global.map_id[_plane],$117,_tile_x,_tile_y); _tile_x++;
			tilemap_set(global.map_id[_plane],$101,_tile_x,_tile_y); _tile_x++;
			tilemap_set(global.map_id[_plane],$001,_tile_x,_tile_y); _tile_x-=6; _tile_y++;
			repeat(5) {tilemap_set(global.map_id[_plane],$101,_tile_x,_tile_y); _tile_x++;}
			tilemap_set(global.map_id[_plane],$101,_tile_x,_tile_y);
		}
		break;
		//-------------------------------------------------------
		case 33:
		{
			_tile_x+=4; _tile_y+=1;
			tilemap_set(global.map_id[_plane],$001,_tile_x,_tile_y); _tile_x++;
			tilemap_set_mirrored(global.map_id[_plane],$117,_tile_x,_tile_y); _tile_x++;
			tilemap_set_mirrored(global.map_id[_plane],$116,_tile_x,_tile_y); _tile_x++;
			tilemap_set_mirrored(global.map_id[_plane],$10A,_tile_x,_tile_y); _tile_x-=3; _tile_y++;
			tilemap_set(global.map_id[_plane],$001,_tile_x,_tile_y); _tile_x++;
			repeat(2) {tilemap_set(global.map_id[_plane],$101,_tile_x,_tile_y); _tile_x++;}
			tilemap_set(global.map_id[_plane],$101,_tile_x,_tile_y); _tile_x-=3; _tile_y++;
			tilemap_set(global.map_id[_plane],$001,_tile_x,_tile_y); _tile_x-=4; _tile_y++;
			repeat(2) {
			repeat(3) {tilemap_set(global.map_id[_plane],$101,_tile_x,_tile_y); _tile_x++;}
				tilemap_set(global.map_id[_plane],$101,_tile_x,_tile_y); _tile_x-=3; _tile_y++;}
		}
		break;
		//-------------------------------------------------------
		case 34:
		{
			_tile_y++;
			tilemap_set_mirrored(global.map_id[_plane],$109,_tile_x,_tile_y); _tile_x++;
			repeat(2) {tilemap_set(global.map_id[_plane],$109,_tile_x,_tile_y); _tile_x++;}
			tilemap_set(global.map_id[_plane],$10A,_tile_x,_tile_y); _tile_x++;
			tilemap_set(global.map_id[_plane],$116,_tile_x,_tile_y); _tile_x++;
			tilemap_set(global.map_id[_plane],$117,_tile_x,_tile_y); _tile_x++;
			tilemap_set(global.map_id[_plane],$101,_tile_x,_tile_y); _tile_x++;
			tilemap_set(global.map_id[_plane],$101,_tile_x,_tile_y); _tile_x-=7; _tile_y++;
			repeat(7) {tilemap_set(global.map_id[_plane],$101,_tile_x,_tile_y); _tile_x++;}
			tilemap_set(global.map_id[_plane],$101,_tile_x,_tile_y);
		}
		break;
		//-------------------------------------------------------
		case 37:
		{
			_tile_y++;
			tilemap_set(global.map_id[_plane],$101,_tile_x,_tile_y); _tile_x++;
			tilemap_set_mirrored(global.map_id[_plane],$117,_tile_x,_tile_y); _tile_x++;
			tilemap_set_mirrored(global.map_id[_plane],$116,_tile_x,_tile_y); _tile_x++;
			repeat(3) {tilemap_set(global.map_id[_plane],$116,_tile_x,_tile_y); _tile_x++;}
			tilemap_set(global.map_id[_plane],$117,_tile_x,_tile_y); _tile_x++;
			tilemap_set(global.map_id[_plane],$001,_tile_x,_tile_y); _tile_x-=7; _tile_y++;
			repeat(7) {tilemap_set(global.map_id[_plane],$101,_tile_x,_tile_y); _tile_x++;}
			repeat(2) {tilemap_set(global.map_id[_plane],$001,_tile_x,_tile_y); _tile_y++;}
			tilemap_set(global.map_id[_plane],$001,_tile_x,_tile_y);
		}
		break;
		//-------------------------------------------------------
		case 38:
		{
			_tile_y+=4;
			tilemap_set(global.map_id[_plane],$101,_tile_x,_tile_y); _tile_x++;
			tilemap_set_mirrored(global.map_id[_plane],$117,_tile_x,_tile_y); _tile_x++;
			tilemap_set_mirrored(global.map_id[_plane],$116,_tile_x,_tile_y); _tile_x++;
			repeat(3) {tilemap_set(global.map_id[_plane],$116,_tile_x,_tile_y); _tile_x++;}
			tilemap_set(global.map_id[_plane],$117,_tile_x,_tile_y); _tile_x++;
			tilemap_set(global.map_id[_plane],$101,_tile_x,_tile_y); _tile_x-=7; _tile_y++;
			repeat(7) {tilemap_set(global.map_id[_plane],$101,_tile_x,_tile_y); _tile_x++;}
			tilemap_set(global.map_id[_plane],$101,_tile_x,_tile_y);
		}
		break;
		//-------------------------------------------------------
		case 41:
		{
			_tile_y++;
			repeat(6) {tilemap_set(global.map_id[_plane],$001,_tile_x,_tile_y); _tile_y++;}
			tilemap_set(global.map_id[_plane],$001,_tile_x,_tile_y); _tile_y-=6; _tile_x++;
			repeat(5) {tilemap_set(global.map_id[_plane],$101,_tile_x,_tile_y); _tile_x++;}
			tilemap_set(global.map_id[_plane],$001,_tile_x,_tile_y); _tile_x++;
			tilemap_set(global.map_id[_plane],$001,_tile_x,_tile_y); _tile_x-=6; _tile_y++;
			repeat(5) {tilemap_set(global.map_id[_plane],$101,_tile_x,_tile_y); _tile_x++;}
			tilemap_set(global.map_id[_plane],$001,_tile_x,_tile_y); _tile_x++;
			tilemap_set(global.map_id[_plane],$001,_tile_x,_tile_y); _tile_x--; _tile_y++;
			repeat(4){tilemap_set(global.map_id[_plane],$001,_tile_x,_tile_y);
				tilemap_set(global.map_id[_plane],$001,_tile_x+1,_tile_y); _tile_y++;}
			tilemap_set(global.map_id[_plane],$001,_tile_x+1,_tile_y);
		}
		break;
		//-------------------------------------------------------
		case 42:
		{
			_tile_y+=7;
			tilemap_set_xy_flipped(global.map_id[_plane],$6D,_tile_x,_tile_y);
		}
		break;
		//-------------------------------------------------------
		case 43:
		{
			repeat(6) {tilemap_set(global.map_id[_plane],$001,_tile_x,_tile_y); _tile_y++;}
			tilemap_set(global.map_id[_plane],$001,_tile_x,_tile_y); _tile_y-=6; _tile_x+=7;
			repeat(3) {tilemap_set(global.map_id[_plane],$001,_tile_x,_tile_y); _tile_y++;}
		}
		break;
		//-------------------------------------------------------
		case 44:
		{
			tilemap_set_xy_flipped(global.map_id[_plane],$6E,_tile_x,_tile_y); _tile_y++;
			tilemap_set_xy_flipped(global.map_id[_plane],$6F,_tile_x,_tile_y); _tile_y++;
			tilemap_set_mirrored(global.map_id[_plane],$001,_tile_x,_tile_y);
			tilemap_set_xy_flipped(global.map_id[_plane],$70,_tile_x+1,_tile_y); _tile_y++;
			tilemap_set(global.map_id[_plane],$001,_tile_x,_tile_y); _tile_x++;
			tilemap_set_mirrored(global.map_id[_plane],$001,_tile_x,_tile_y); _tile_x++;
			tilemap_set_xy_flipped(global.map_id[_plane],$171,_tile_x,_tile_y); _tile_x++;
			tilemap_set_xy_flipped(global.map_id[_plane],$172,_tile_x,_tile_y); _tile_x++;
			tilemap_set_xy_flipped(global.map_id[_plane],$173,_tile_x,_tile_y); _tile_x-=3; _tile_y++;
			repeat(4) {tilemap_set(global.map_id[_plane],$101,_tile_x,_tile_y); _tile_x++;}
			repeat(3)
			{	tilemap_set(global.map_id[_plane],$101,_tile_x,_tile_y);
				tilemap_set(global.map_id[_plane],$101,_tile_x,_tile_y+1); _tile_x++;}
		}
		break;
		//-------------------------------------------------------
		case 47:
		case 48:
		{
			_tile_y+=4;
			tilemap_set(global.map_id[_plane],$101,_tile_x,_tile_y); _tile_x++;
			tilemap_set_mirrored(global.map_id[_plane],$117,_tile_x,_tile_y); _tile_x++;
			tilemap_set_mirrored(global.map_id[_plane],$116,_tile_x,_tile_y); _tile_x++;
			repeat(2) {tilemap_set(global.map_id[_plane],$116,_tile_x,_tile_y); _tile_x++;}
			tilemap_set(global.map_id[_plane],$117,_tile_x,_tile_y); _tile_x++;
			tilemap_set(global.map_id[_plane],$101,_tile_x,_tile_y); _tile_x++;
			tilemap_set(global.map_id[_plane],$101,_tile_x,_tile_y); _tile_x-=7; _tile_y++;
			repeat(7) {tilemap_set(global.map_id[_plane],$101,_tile_x,_tile_y); _tile_x++;}
			tilemap_set(global.map_id[_plane],$101,_tile_x,_tile_y);
		}
		break;
		//-------------------------------------------------------
		case 53:
		{
			_tile_x+=2;
			tilemap_set(global.map_id[_plane],$111,_tile_x,_tile_y); _tile_x++;
			tilemap_set_mirrored(global.map_id[_plane],$111,_tile_x,_tile_y); _tile_x+=4;
			tilemap_set(global.map_id[_plane],$111,_tile_x,_tile_y); _tile_x-=7; _tile_y++;
			repeat(2){ tilemap_set(global.map_id[_plane],$001,_tile_x,_tile_y); _tile_x++;
			repeat(6) { tilemap_set(global.map_id[_plane],$101,_tile_x,_tile_y); _tile_x++; }
			tilemap_set(global.map_id[_plane],$101,_tile_x,_tile_y); _tile_x-=7; _tile_y++;}
			repeat(4) { tilemap_set(global.map_id[_plane],$001,_tile_x,_tile_y); _tile_y++; }
			tilemap_set(global.map_id[_plane],$001,_tile_x,_tile_y);
		}
		break;
		//-------------------------------------------------------
		case 54:
		{
			tilemap_set(global.map_id[_plane],$112,_tile_x,_tile_y); _tile_x++;
			tilemap_set_mirrored(global.map_id[_plane],$112,_tile_x,_tile_y); _tile_x++;
			tilemap_set_mirrored(global.map_id[_plane],$111,_tile_x,_tile_y); _tile_x+=3;
			repeat(2) { tilemap_set(global.map_id[_plane],$111,_tile_x,_tile_y); _tile_x++; }
			tilemap_set(global.map_id[_plane],$111,_tile_x,_tile_y); _tile_x-=7; _tile_y++;
			repeat(7) { tilemap_set(global.map_id[_plane],$101,_tile_x,_tile_y); _tile_x++; }
			tilemap_set(global.map_id[_plane],$101,_tile_x,_tile_y); _tile_x-=7; _tile_y++;
			repeat(7) { tilemap_set(global.map_id[_plane],$101,_tile_x,_tile_y); _tile_x++; }
			tilemap_set(global.map_id[_plane],$101,_tile_x,_tile_y);
		}
		break;
		//-------------------------------------------------------
		case 55:
		{
			repeat(7) { tilemap_set(global.map_id[_plane],$001,_tile_x,_tile_y); _tile_y++; }
			tilemap_set(global.map_id[_plane],$001,_tile_x,_tile_y);
		}
		break;
		//-------------------------------------------------------
		case 60:
		{
			tilemap_set(global.map_id[_plane],$001,_tile_x,_tile_y); _tile_x++;
			tilemap_set_mirrored(global.map_id[_plane],$117,_tile_x,_tile_y); _tile_x++;
			tilemap_set_mirrored(global.map_id[_plane],$116,_tile_x,_tile_y); _tile_x++;
			tilemap_set_mirrored(global.map_id[_plane],$115,_tile_x,_tile_y); _tile_x++;
			tilemap_set(global.map_id[_plane],$115,_tile_x,_tile_y); _tile_x++;
			tilemap_set(global.map_id[_plane],$116,_tile_x,_tile_y); _tile_x++;
			tilemap_set(global.map_id[_plane],$117,_tile_x,_tile_y); _tile_x++;
			tilemap_set(global.map_id[_plane],$101,_tile_x,_tile_y); _tile_x-=7; _tile_y++;
			tilemap_set(global.map_id[_plane],$001,_tile_x,_tile_y); _tile_x++;
			repeat(6) {tilemap_set(global.map_id[_plane],$101,_tile_x,_tile_y); _tile_x++;}
			tilemap_set(global.map_id[_plane],$101,_tile_x,_tile_y); _tile_x-=7; _tile_y++;
			repeat(5) {tilemap_set(global.map_id[_plane],$001,_tile_x,_tile_y); _tile_y++;}
			tilemap_set(global.map_id[_plane],$001,_tile_x,_tile_y);
		}
		break;
		//-------------------------------------------------------
		case 61:
		{
			tilemap_set(global.map_id[_plane],$101,_tile_x,_tile_y); _tile_x++;
			tilemap_set_mirrored(global.map_id[_plane],$117,_tile_x,_tile_y); _tile_x++;
			tilemap_set_mirrored(global.map_id[_plane],$116,_tile_x,_tile_y); _tile_x++;
			tilemap_set_mirrored(global.map_id[_plane],$115,_tile_x,_tile_y); _tile_x++;
			tilemap_set_mirrored(global.map_id[_plane],$115,_tile_x,_tile_y); _tile_x++;
			tilemap_set(global.map_id[_plane],$115,_tile_x,_tile_y); _tile_x++;
			tilemap_set(global.map_id[_plane],$116,_tile_x,_tile_y); _tile_x++;
			tilemap_set(global.map_id[_plane],$101,_tile_x,_tile_y); _tile_x-=7; _tile_y++;
			repeat(7) { tilemap_set(global.map_id[_plane],$101,_tile_x,_tile_y); _tile_x++; }
			tilemap_set(global.map_id[_plane],$101,_tile_x,_tile_y);
		}
		break;
		//-------------------------------------------------------
		case 64:
		case 128:
		{
			repeat(3) { tilemap_set(global.map_id[_plane],$101,_tile_x,_tile_y); _tile_x++; }
			tilemap_set_mirrored(global.map_id[_plane],$117,_tile_x,_tile_y); _tile_x++;
			tilemap_set_mirrored(global.map_id[_plane],$116,_tile_x,_tile_y); _tile_x++;
			tilemap_set_mirrored(global.map_id[_plane],$10A,_tile_x,_tile_y); _tile_x++;
			tilemap_set_mirrored(global.map_id[_plane],$109,_tile_x,_tile_y); _tile_x++;
			tilemap_set_mirrored(global.map_id[_plane],$109,_tile_x,_tile_y); _tile_x-=7; _tile_y++;
			repeat(7) { tilemap_set(global.map_id[_plane],$101,_tile_x,_tile_y); _tile_x++; }
			tilemap_set(global.map_id[_plane],$101,_tile_x,_tile_y);
		}
		break;
		//-------------------------------------------------------
		case 65:
		case 129:
		{
			tilemap_set(global.map_id[_plane],$109,_tile_x,_tile_y); _tile_x++;
			tilemap_set(global.map_id[_plane],$10A,_tile_x,_tile_y); _tile_x++;
			tilemap_set(global.map_id[_plane],$116,_tile_x,_tile_y); _tile_x++;
			tilemap_set(global.map_id[_plane],$117,_tile_x,_tile_y); _tile_x++;
			repeat(3) { tilemap_set(global.map_id[_plane],$101,_tile_x,_tile_y); _tile_x++; }
			tilemap_set(global.map_id[_plane],$101,_tile_x,_tile_y); _tile_x-=7; _tile_y++;
			repeat(7) { tilemap_set(global.map_id[_plane],$101,_tile_x,_tile_y); _tile_x++; }
			tilemap_set(global.map_id[_plane],$101,_tile_x,_tile_y);
		}
		break;
		//-------------------------------------------------------
		case 68:
		{
			repeat(7) { tilemap_set(global.map_id[_plane],$001,_tile_x,_tile_y); _tile_y++; }
			tilemap_set(global.map_id[_plane],$001,_tile_x,_tile_y); _tile_y-=7; _tile_x++;
			tilemap_set_mirrored(global.map_id[_plane],$11C,_tile_x,_tile_y);
			tilemap_set(global.map_id[_plane],$101,_tile_x,_tile_y+1); _tile_x++;
			tilemap_set_mirrored(global.map_id[_plane],$115,_tile_x,_tile_y);
			tilemap_set(global.map_id[_plane],$101,_tile_x,_tile_y+1); _tile_x++;
			tilemap_set(global.map_id[_plane],$115,_tile_x,_tile_y);
			tilemap_set(global.map_id[_plane],$101,_tile_x,_tile_y+1); _tile_x++;
			tilemap_set(global.map_id[_plane],$116,_tile_x,_tile_y);
			tilemap_set(global.map_id[_plane],$101,_tile_x,_tile_y+1); _tile_x++;
			tilemap_set(global.map_id[_plane],$117,_tile_x,_tile_y);
			tilemap_set(global.map_id[_plane],$101,_tile_x,_tile_y+1); _tile_x++;
			tilemap_set(global.map_id[_plane],$101,_tile_x,_tile_y);
			tilemap_set(global.map_id[_plane],$101,_tile_x,_tile_y+1); _tile_x++;
			repeat(7) { tilemap_set(global.map_id[_plane],$001,_tile_x,_tile_y); _tile_y++; }
			tilemap_set(global.map_id[_plane],$001,_tile_x,_tile_y);
		}
		break;
		//-------------------------------------------------------
		case 69:
		case 73:
		case 81:
		{
			_tile_y++;
			tilemap_set(global.map_id[_plane],$101,_tile_x,_tile_y); _tile_x++;
			tilemap_set_mirrored(global.map_id[_plane],$117,_tile_x,_tile_y); _tile_x++;
			tilemap_set_mirrored(global.map_id[_plane],$116,_tile_x,_tile_y); _tile_x++;
			tilemap_set_mirrored(global.map_id[_plane],$115,_tile_x,_tile_y); _tile_x++;
			tilemap_set(global.map_id[_plane],$115,_tile_x,_tile_y); _tile_x++;
			tilemap_set(global.map_id[_plane],$115,_tile_x,_tile_y); _tile_x++;
			tilemap_set(global.map_id[_plane],$116,_tile_x,_tile_y); _tile_x++;
			tilemap_set(global.map_id[_plane],$116,_tile_x,_tile_y); _tile_x-=7; _tile_y++;
			repeat(7) { tilemap_set(global.map_id[_plane],$101,_tile_x,_tile_y); _tile_x++; }
			tilemap_set(global.map_id[_plane],$101,_tile_x,_tile_y);
		}
		break;
		//-------------------------------------------------------
		case 70:
		case 74:
		case 82:
		{
			_tile_y++;
			tilemap_set(global.map_id[_plane],$117,_tile_x,_tile_y); _tile_x++;
			repeat(2) { tilemap_set(global.map_id[_plane],$101,_tile_x,_tile_y); _tile_x++; }
			tilemap_set(global.map_id[_plane],$101,_tile_x,_tile_y); _tile_x-=3; _tile_y++;
			repeat(3) { tilemap_set(global.map_id[_plane],$101,_tile_x,_tile_y); _tile_x++; }
			tilemap_set(global.map_id[_plane],$101,_tile_x,_tile_y);
		}
		break;
		//-------------------------------------------------------
		case 71:
		case 75:
		case 83:
		{
			_tile_x+=5; _tile_y++;
			tilemap_set(global.map_id[_plane],$119,_tile_x,_tile_y); _tile_x++;
			tilemap_set(global.map_id[_plane],$11A,_tile_x,_tile_y); _tile_x++;
			tilemap_set(global.map_id[_plane],$11B,_tile_x,_tile_y); _tile_x-=3; _tile_y++;
			repeat(3) { tilemap_set(global.map_id[_plane],$101,_tile_x,_tile_y); _tile_x++; }
			tilemap_set(global.map_id[_plane],$101,_tile_x,_tile_y); _tile_x-=3; _tile_y++;
			tilemap_set(global.map_id[_plane],$101,_tile_x,_tile_y);
		}
		break;
		//-------------------------------------------------------
		case 72:
		case 84:
		{
			_tile_x++;
			tilemap_set(global.map_id[_plane],$11D,_tile_x,_tile_y); _tile_x++;
			tilemap_set(global.map_id[_plane],$11E,_tile_x,_tile_y); _tile_x++;
			tilemap_set(global.map_id[_plane],$101,_tile_x,_tile_y); _tile_x++;
			tilemap_set(global.map_id[_plane],$101,_tile_x,_tile_y); _tile_x++;
			tilemap_set(global.map_id[_plane],$101,_tile_x,_tile_y); _tile_x++;
			tilemap_set(global.map_id[_plane],$101,_tile_x,_tile_y); _tile_x++;
			tilemap_set(global.map_id[_plane],$101,_tile_x,_tile_y); _tile_x-=7; _tile_y++;
			tilemap_set(global.map_id[_plane],$11C,_tile_x,_tile_y); _tile_x++;
			repeat(6) { tilemap_set(global.map_id[_plane],$101,_tile_x,_tile_y); _tile_x++; }
			tilemap_set(global.map_id[_plane],$101,_tile_x,_tile_y); _tile_x-=7; _tile_y++;
			tilemap_set(global.map_id[_plane],$101,_tile_x,_tile_y);
		}
		break;
		//-------------------------------------------------------
		case 76:
		{ //- slightly different collision from 72 and 84
			_tile_x++;
			tilemap_set(global.map_id[_plane],$11D,_tile_x,_tile_y); _tile_x++;
			tilemap_set(global.map_id[_plane],$11E,_tile_x,_tile_y); _tile_x++;
			tilemap_set(global.map_id[_plane],$101,_tile_x,_tile_y); _tile_x++;
			tilemap_set_mirrored(global.map_id[_plane],$117,_tile_x,_tile_y); _tile_x++;
			tilemap_set(global.map_id[_plane],$117,_tile_x,_tile_y); _tile_x++;
			tilemap_set(global.map_id[_plane],$101,_tile_x,_tile_y); _tile_x++;
			tilemap_set(global.map_id[_plane],$101,_tile_x,_tile_y); _tile_x-=7; _tile_y++;
			tilemap_set(global.map_id[_plane],$11C,_tile_x,_tile_y); _tile_x++;
			repeat(6) { tilemap_set(global.map_id[_plane],$101,_tile_x,_tile_y); _tile_x++; }
			tilemap_set(global.map_id[_plane],$101,_tile_x,_tile_y); _tile_x-=7; _tile_y++;
			tilemap_set(global.map_id[_plane],$101,_tile_x,_tile_y);
		}
		break;
		//-------------------------------------------------------
		case 79:
		{
			_tile_y+=4;
			repeat(5) { tilemap_set(global.map_id[_plane],$101,_tile_x,_tile_y); _tile_x++; }
			tilemap_set_mirrored(global.map_id[_plane],$117,_tile_x,_tile_y); _tile_x++;
			tilemap_set_mirrored(global.map_id[_plane],$116,_tile_x,_tile_y); _tile_x++;
			tilemap_set_mirrored(global.map_id[_plane],$10A,_tile_x,_tile_y); _tile_x-=7; _tile_y++;
			repeat(7) { tilemap_set(global.map_id[_plane],$101,_tile_x,_tile_y); _tile_x++; }
			tilemap_set(global.map_id[_plane],$101,_tile_x,_tile_y);
		}
		break;
		//-------------------------------------------------------
		case 80:
		case 99:
		{
			_tile_y+=4;
			repeat(3) { tilemap_set(global.map_id[_plane],$109,_tile_x,_tile_y); _tile_x++; }
			tilemap_set(global.map_id[_plane],$10A,_tile_x,_tile_y); _tile_x++;
			tilemap_set(global.map_id[_plane],$116,_tile_x,_tile_y); _tile_x++;
			tilemap_set(global.map_id[_plane],$117,_tile_x,_tile_y); _tile_x++;
			tilemap_set(global.map_id[_plane],$101,_tile_x,_tile_y); _tile_x++;
			tilemap_set(global.map_id[_plane],$101,_tile_x,_tile_y); _tile_x-=7; _tile_y++;
			repeat(7) { tilemap_set(global.map_id[_plane],$101,_tile_x,_tile_y); _tile_x++; }
			tilemap_set(global.map_id[_plane],$101,_tile_x,_tile_y);
		}
		break;
		//-------------------------------------------------------
		case 109:
			_tile_x+=4;
		case 85:
		case 108:
		{
			_tile_y+=4;
			repeat(3) { tilemap_set(global.map_id[_plane],$101,_tile_x,_tile_y); _tile_x++; }
			tilemap_set(global.map_id[_plane],$101,_tile_x,_tile_y); _tile_x-=3; _tile_y++;
			repeat(3) { tilemap_set(global.map_id[_plane],$101,_tile_x,_tile_y); _tile_x++; }
			tilemap_set(global.map_id[_plane],$101,_tile_x,_tile_y);
		}
		break;
		//-------------------------------------------------------
		case 95:
		{
			_tile_x+=6; _tile_y+=2;
			tilemap_set(global.map_id[_plane],$001,_tile_x,_tile_y); _tile_x++;
			tilemap_set_mirrored(global.map_id[_plane],$117,_tile_x,_tile_y); _tile_x--; _tile_y++;
			tilemap_set(global.map_id[_plane],$001,_tile_x,_tile_y); _tile_x++;
			tilemap_set(global.map_id[_plane],$101,_tile_x,_tile_y); _tile_x-=7; _tile_y++;
			tilemap_set(global.map_id[_plane],$101,_tile_x,_tile_y); _tile_x++;
			tilemap_set_mirrored(global.map_id[_plane],$117,_tile_x,_tile_y); _tile_x++;
			tilemap_set_mirrored(global.map_id[_plane],$116,_tile_x,_tile_y); _tile_x++;
			tilemap_set(global.map_id[_plane],$116,_tile_x,_tile_y); _tile_x++;
			tilemap_set(global.map_id[_plane],$117,_tile_x,_tile_y); _tile_x++;
			tilemap_set(global.map_id[_plane],$101,_tile_x,_tile_y); _tile_x++;
			tilemap_set(global.map_id[_plane],$001,_tile_x,_tile_y); _tile_x-=6; _tile_y++;
			repeat(5) { tilemap_set(global.map_id[_plane],$101,_tile_x,_tile_y); _tile_x++; }
			tilemap_set(global.map_id[_plane],$101,_tile_x,_tile_y);
		}
		break;
		//-------------------------------------------------------
		case 96:
		{
			_tile_x+=4;
			repeat(2) { tilemap_set(global.map_id[_plane],$001,_tile_x,_tile_y); _tile_x++;
			repeat(2) { tilemap_set(global.map_id[_plane],$101,_tile_x,_tile_y); _tile_x++; }
			tilemap_set(global.map_id[_plane],$101,_tile_x,_tile_y); _tile_x-=3; _tile_y++; } _tile_x-=4;
			tilemap_set_mirrored(global.map_id[_plane],$116,_tile_x,_tile_y); _tile_x++;
			tilemap_set(global.map_id[_plane],$116,_tile_x,_tile_y); _tile_x++;
			tilemap_set(global.map_id[_plane],$117,_tile_x,_tile_y); _tile_x++;
			tilemap_set(global.map_id[_plane],$101,_tile_x,_tile_y); _tile_x++;
			tilemap_set(global.map_id[_plane],$001,_tile_x,_tile_y); _tile_x-=4; _tile_y++;
			repeat(3) { tilemap_set(global.map_id[_plane],$101,_tile_x,_tile_y); _tile_x++; }
			tilemap_set(global.map_id[_plane],$101,_tile_x,_tile_y);
		}
		break;
		//-------------------------------------------------------
		case 100:
		{
			_tile_x+=5; _tile_y+=7;
			tilemap_set(global.map_id[_plane],$119,_tile_x,_tile_y); _tile_x++;
			tilemap_set(global.map_id[_plane],$11A,_tile_x,_tile_y); _tile_x++;
			tilemap_set(global.map_id[_plane],$11B,_tile_x,_tile_y);
		}
		break;
		//-------------------------------------------------------
		case 101:
		{
			_tile_y+=7;
			tilemap_set(global.map_id[_plane],$11C,_tile_x,_tile_y); _tile_x++;
			tilemap_set(global.map_id[_plane],$101,_tile_x,_tile_y); _tile_x++;
			tilemap_set(global.map_id[_plane],$101,_tile_x,_tile_y); _tile_x--; _tile_y--;
			tilemap_set(global.map_id[_plane],$11D,_tile_x,_tile_y); _tile_x++;
			tilemap_set(global.map_id[_plane],$11E,_tile_x,_tile_y); _tile_x++;
			tilemap_set(global.map_id[_plane],$101,_tile_x,_tile_y); _tile_x++;
			tilemap_set(global.map_id[_plane],$101,_tile_x,_tile_y); _tile_x--; _tile_y--;
			tilemap_set(global.map_id[_plane],$11D,_tile_x,_tile_y); _tile_x++;
			tilemap_set(global.map_id[_plane],$11E,_tile_x,_tile_y); _tile_x++;
			repeat(2) { tilemap_set(global.map_id[_plane],$101,_tile_x,_tile_y); _tile_x++; }
			tilemap_set(global.map_id[_plane],$101,_tile_x,_tile_y); _tile_x-=2; _tile_y--;
			tilemap_set(global.map_id[_plane],$11D,_tile_x,_tile_y); _tile_x++;
			tilemap_set(global.map_id[_plane],$11E,_tile_x,_tile_y); _tile_x++;
			tilemap_set(global.map_id[_plane],$101,_tile_x,_tile_y);
		}
		break;
		//-------------------------------------------------------
		case 102:
		{
			repeat(7) { tilemap_set(global.map_id[_plane],$101,_tile_x,_tile_y); _tile_x++; }
			tilemap_set(global.map_id[_plane],$101,_tile_x,_tile_y); _tile_x-=7; _tile_y++;
			repeat(5) { tilemap_set(global.map_id[_plane],$101,_tile_x,_tile_y); _tile_x++; }
		}
		break;
		//-------------------------------------------------------
		case 103:
		{
			tilemap_set(global.map_id[_plane],$101,_tile_x,_tile_y);
		}
		break;
		//-------------------------------------------------------
		case 104:
		{
			_tile_y+=7; _tile_x++;
			tilemap_set(global.map_id[_plane],$11D,_tile_x,_tile_y); _tile_x++;
			tilemap_set(global.map_id[_plane],$115,_tile_x,_tile_y); _tile_x++;
			tilemap_set(global.map_id[_plane],$115,_tile_x,_tile_y); _tile_x++;
			tilemap_set(global.map_id[_plane],$116,_tile_x,_tile_y); _tile_x++;
			tilemap_set(global.map_id[_plane],$11C,_tile_x,_tile_y); _tile_x++;
			tilemap_set(global.map_id[_plane],$101,_tile_x,_tile_y); _tile_x++;
			tilemap_set(global.map_id[_plane],$101,_tile_x,_tile_y); _tile_x--; _tile_y--;
			tilemap_set(global.map_id[_plane],$11D,_tile_x,_tile_y); _tile_x++;
			tilemap_set(global.map_id[_plane],$11E,_tile_x,_tile_y);
		}
		break;
		//-------------------------------------------------------
		case 105:
		{
			_tile_y+=6;
			tilemap_set(global.map_id[_plane],$101,_tile_x,_tile_y); _tile_x++;
			tilemap_set(global.map_id[_plane],$101,_tile_x,_tile_y); _tile_x--; _tile_y--;
			tilemap_set(global.map_id[_plane],$11D,_tile_x,_tile_y); _tile_x++;
			tilemap_set(global.map_id[_plane],$11E,_tile_x,_tile_y); _tile_x++;
			repeat(5) { tilemap_set(global.map_id[_plane],$101,_tile_x,_tile_y); _tile_x++; }
			tilemap_set(global.map_id[_plane],$101,_tile_x,_tile_y); _tile_x-=5; _tile_y--;
			tilemap_set(global.map_id[_plane],$11D,_tile_x,_tile_y); _tile_x++;
			tilemap_set(global.map_id[_plane],$115,_tile_x,_tile_y); _tile_x++;
			tilemap_set_mirrored(global.map_id[_plane],$115,_tile_x,_tile_y); _tile_x++;
			tilemap_set(global.map_id[_plane],$115,_tile_x,_tile_y); _tile_x++;
			tilemap_set(global.map_id[_plane],$116,_tile_x,_tile_y); _tile_x++;
			tilemap_set(global.map_id[_plane],$101,_tile_x,_tile_y);
		}
		break;
		//-------------------------------------------------------
		case 106:
		{
			tilemap_set(global.map_id[_plane],$101,_tile_x,_tile_y);
			tilemap_set(global.map_id[_plane],$101,_tile_x,_tile_y+1); _tile_x++;
			repeat(5) { tilemap_set(global.map_id[_plane],$101,_tile_x,_tile_y); _tile_x++; }
		}
		break;
		//-------------------------------------------------------
		case 116:
		{
			repeat(4) { tilemap_set(global.map_id[_plane],$001,_tile_x,_tile_y); _tile_y++; }
			repeat(2) { repeat(7) { tilemap_set(global.map_id[_plane],$001,_tile_x,_tile_y); _tile_x++; }
			tilemap_set(global.map_id[_plane],$001,_tile_x,_tile_y); _tile_x-=7; _tile_y++; } _tile_x+=3;
			tilemap_set_flipped(global.map_id[_plane],$24,_tile_x,_tile_y); _tile_x++;
			tilemap_set_flipped(global.map_id[_plane],$25,_tile_x,_tile_y); _tile_x++;
			tilemap_set_flipped(global.map_id[_plane],$26,_tile_x,_tile_y); _tile_x++;
			tilemap_set_flipped(global.map_id[_plane],$27,_tile_x,_tile_y); _tile_x++;
			tilemap_set(global.map_id[_plane],$001,_tile_x,_tile_y); _tile_x--; _tile_y++;
			tilemap_set_flipped(global.map_id[_plane],$28,_tile_x,_tile_y); _tile_x++;
			tilemap_set_flipped(global.map_id[_plane],$29,_tile_x,_tile_y);
		}
		break;
		//-------------------------------------------------------
		case 117:
		{
			_tile_x+=7;
			repeat(7) { tilemap_set(global.map_id[_plane],$001,_tile_x,_tile_y); _tile_y++; }
			tilemap_set(global.map_id[_plane],$001,_tile_x,_tile_y); _tile_y-=3; _tile_x-=7;
			repeat(4) {
				tilemap_set(global.map_id[_plane],$001,_tile_x,_tile_y);
				tilemap_set(global.map_id[_plane],$001,_tile_x+1,_tile_y); _tile_y++; }
		}
		break;
		//-------------------------------------------------------
		case 118:
		{
			repeat(3) { tilemap_set(global.map_id[_plane],$001,_tile_x,_tile_y); _tile_x++; }
			tilemap_set_flipped(global.map_id[_plane],$3A,_tile_x,_tile_y); _tile_x++;
			tilemap_set_flipped(global.map_id[_plane],$3B,_tile_x,_tile_y); _tile_x++;
			tilemap_set_flipped(global.map_id[_plane],$3C,_tile_x,_tile_y); _tile_x+=2;
			tilemap_set_flipped(global.map_id[_plane],$30,_tile_x,_tile_y); _tile_x-=7; _tile_y++;
			repeat(5) { tilemap_set(global.map_id[_plane],$001,_tile_x,_tile_y); _tile_x++; }
			tilemap_set_flipped(global.map_id[_plane],$52,_tile_x,_tile_y); _tile_x++;
			tilemap_set_flipped(global.map_id[_plane],$53,_tile_x,_tile_y); _tile_x--; _tile_y++;
			tilemap_set(global.map_id[_plane],$001,_tile_x,_tile_y); _tile_x++;
			tilemap_set_flipped(global.map_id[_plane],$3E,_tile_x,_tile_y); _tile_x--; _tile_y++;
			tilemap_set(global.map_id[_plane],$001,_tile_x,_tile_y); _tile_x++;
			tilemap_set_xy_flipped(global.map_id[_plane],$4F,_tile_x,_tile_y); _tile_x--; _tile_y++;
			tilemap_set(global.map_id[_plane],$001,_tile_x,_tile_y); _tile_x++;
			tilemap_set(global.map_id[_plane],$3E,_tile_x,_tile_y); _tile_x-=2; _tile_y++;
			tilemap_set(global.map_id[_plane],$001,_tile_x,_tile_y); _tile_x++;
			tilemap_set(global.map_id[_plane],$52,_tile_x,_tile_y); _tile_x++;
			tilemap_set(global.map_id[_plane],$53,_tile_x,_tile_y); _tile_x-=2; _tile_y++;
			tilemap_set(global.map_id[_plane],$4C,_tile_x,_tile_y); _tile_x++;
			tilemap_set(global.map_id[_plane],$4D,_tile_x,_tile_y); _tile_x+=2;
			tilemap_set_xy_flipped(global.map_id[_plane],$4D,_tile_x,_tile_y); _tile_x-=4; _tile_y++;
			tilemap_set(global.map_id[_plane],$001,_tile_x,_tile_y); _tile_x++;
			tilemap_set_xy_flipped(global.map_id[_plane],$38,_tile_x,_tile_y); _tile_x+=2;
			tilemap_set_xy_flipped(global.map_id[_plane],$53,_tile_x,_tile_y); _tile_x++;
			tilemap_set_xy_flipped(global.map_id[_plane],$52,_tile_x,_tile_y);
		}
		break;
		//-------------------------------------------------------
		case 119:
		{
			tilemap_set_flipped(global.map_id[_plane],$31,_tile_x,_tile_y); _tile_y++;
			tilemap_set_flipped(global.map_id[_plane],$38,_tile_x,_tile_y); _tile_y++;
			tilemap_set_flipped(global.map_id[_plane],$32,_tile_x,_tile_y); _tile_y++;
			tilemap_set_xy_flipped(global.map_id[_plane],$4E,_tile_x,_tile_y); _tile_y++;
			tilemap_set(global.map_id[_plane],$32,_tile_x,_tile_y); _tile_y++;
			tilemap_set(global.map_id[_plane],$38,_tile_x,_tile_y); _tile_y++;
			tilemap_set_xy_flipped(global.map_id[_plane],$4C,_tile_x,_tile_y); _tile_y++;
			tilemap_set(global.map_id[_plane],$001,_tile_x,_tile_y); _tile_y-=7; _tile_x++;
			repeat(7) { tilemap_set(global.map_id[_plane],$001,_tile_x,_tile_y); _tile_y++; }
			tilemap_set(global.map_id[_plane],$001,_tile_x,_tile_y); _tile_y-=7; _tile_x+=6;
			repeat(7) { tilemap_set(global.map_id[_plane],$001,_tile_x,_tile_y); _tile_y++; }
			tilemap_set(global.map_id[_plane],$001,_tile_x,_tile_y);
		}
		break;
		//-------------------------------------------------------
		case 120:
		{
			_tile_x+=3;
			repeat(4) { tilemap_set(global.map_id[_plane],$001,_tile_x,_tile_y); _tile_y++; }
			tilemap_set(global.map_id[_plane],$001,_tile_x,_tile_y); _tile_y-=4; _tile_x++;
			tilemap_set_xy_flipped(global.map_id[_plane],$32,_tile_x,_tile_y); _tile_y++;
			tilemap_set_flipped(global.map_id[_plane],$4E,_tile_x,_tile_y); _tile_y++;
			tilemap_set_flipped(global.map_id[_plane],$4E,_tile_x,_tile_y); _tile_y++;
			tilemap_set_mirrored(global.map_id[_plane],$32,_tile_x,_tile_y); _tile_y++;
			tilemap_set_mirrored(global.map_id[_plane],$38,_tile_x,_tile_y); _tile_y++;
			tilemap_set_mirrored(global.map_id[_plane],$31,_tile_x,_tile_y); _tile_y++;
			tilemap_set(global.map_id[_plane],$001,_tile_x,_tile_y); _tile_y--; _tile_x++;
			tilemap_set_mirrored(global.map_id[_plane],$30,_tile_x,_tile_y); _tile_y++;
			tilemap_set_mirrored(global.map_id[_plane],$29,_tile_x,_tile_y); _tile_y++;
			tilemap_set(global.map_id[_plane],$001,_tile_x,_tile_y); _tile_y-=7; _tile_x++;
			tilemap_set_xy_flipped(global.map_id[_plane],$3E,_tile_x,_tile_y); _tile_y++;
			tilemap_set_flipped(global.map_id[_plane],$4F,_tile_x,_tile_y); _tile_y++;
			tilemap_set_flipped(global.map_id[_plane],$4F,_tile_x,_tile_y); _tile_y++;
			tilemap_set_mirrored(global.map_id[_plane],$3E,_tile_x,_tile_y); _tile_y++;
			tilemap_set_mirrored(global.map_id[_plane],$53,_tile_x,_tile_y); _tile_y+=2;
			tilemap_set_mirrored(global.map_id[_plane],$28,_tile_x,_tile_y); _tile_y++;
			tilemap_set_mirrored(global.map_id[_plane],$27,_tile_x,_tile_y); _tile_y-=7; _tile_x++;
			repeat(4) { tilemap_set(global.map_id[_plane],$001,_tile_x,_tile_y); _tile_y++; }
			tilemap_set_mirrored(global.map_id[_plane],$52,_tile_x,_tile_y); _tile_y++;
			tilemap_set_mirrored(global.map_id[_plane],$3C,_tile_x,_tile_y); _tile_y+=2;
			tilemap_set_mirrored(global.map_id[_plane],$26,_tile_x,_tile_y);
		}
		break;
		//-------------------------------------------------------
		case 121:
		{
			_tile_y+=4;
			tilemap_set(global.map_id[_plane],$001,_tile_x,_tile_y); _tile_y++;
			tilemap_set_mirrored(global.map_id[_plane],$3B,_tile_x,_tile_y); _tile_y+=2;
			tilemap_set_mirrored(global.map_id[_plane],$25,_tile_x,_tile_y); _tile_y-=7; _tile_x++;
			repeat(5) { tilemap_set(global.map_id[_plane],$001,_tile_x,_tile_y); _tile_y++; }
			tilemap_set_mirrored(global.map_id[_plane],$3A,_tile_x,_tile_y); _tile_y+=2;
			tilemap_set_mirrored(global.map_id[_plane],$24,_tile_x,_tile_y); _tile_y-=2; _tile_x++;
			repeat(5) { tilemap_set(global.map_id[_plane],$001,_tile_x,_tile_y); _tile_x++; }
			repeat(5) { tilemap_set(global.map_id[_plane],$001,_tile_x,_tile_y); _tile_y--; }
			tilemap_set(global.map_id[_plane],$001,_tile_x,_tile_y);
		}
		break;
		//-------------------------------------------------------
		case 122:
		{
			_tile_x+=7;
			tilemap_set(global.map_id[_plane],$001,_tile_x,_tile_y);
		}
		break;
		//-------------------------------------------------------
		case 123:
		{
			repeat(7) { tilemap_set(global.map_id[_plane],$001,_tile_x,_tile_y); _tile_x++;}
			tilemap_set(global.map_id[_plane],$001,_tile_x,_tile_y); _tile_x-=5; _tile_y++;
			repeat(5) { tilemap_set(global.map_id[_plane],$001,_tile_x,_tile_y); _tile_x++;}
			tilemap_set(global.map_id[_plane],$001,_tile_x,_tile_y);
		}
		break;
		//-------------------------------------------------------
		case 125:
		{
			_tile_x+=4; _tile_y+=4;
			repeat(3) { tilemap_set(global.map_id[_plane],$101,_tile_x,_tile_y); _tile_x++; }
			tilemap_set(global.map_id[_plane],$101,_tile_x,_tile_y); _tile_x-=3; _tile_y++;
			repeat(3) { tilemap_set(global.map_id[_plane],$101,_tile_x,_tile_y); _tile_x++; }
			tilemap_set(global.map_id[_plane],$101,_tile_x,_tile_y);
		}
		break;
		//-------------------------------------------------------
		case 130:
		{
			_tile_y+=4;
			repeat(2) { tilemap_set(global.map_id[_plane],$101,_tile_x,_tile_y); _tile_x++; }
			tilemap_set_mirrored(global.map_id[_plane],$117,_tile_x,_tile_y); _tile_x++;
			tilemap_set_mirrored(global.map_id[_plane],$116,_tile_x,_tile_y); _tile_x++;
			tilemap_set_mirrored(global.map_id[_plane],$115,_tile_x,_tile_y); _tile_x++;
			tilemap_set_mirrored(global.map_id[_plane],$11A,_tile_x,_tile_y); _tile_x++;
			tilemap_set_mirrored(global.map_id[_plane],$119,_tile_x,_tile_y); _tile_x-=6; _tile_y++;
			repeat(7) { tilemap_set(global.map_id[_plane],$101,_tile_x,_tile_y); _tile_x++; }
			tilemap_set_mirrored(global.map_id[_plane],$11E,_tile_x,_tile_y); _tile_y++;
			tilemap_set(global.map_id[_plane],$101,_tile_x,_tile_y);
		}
		break;
		//-------------------------------------------------------
		case 131:
		{
			_tile_y+=5;
			tilemap_set_mirrored(global.map_id[_plane],$11D,_tile_x,_tile_y); _tile_y++;
			tilemap_set(global.map_id[_plane],$101,_tile_x,_tile_y); _tile_x++;
			tilemap_set_mirrored(global.map_id[_plane],$11E,_tile_x,_tile_y); _tile_x++;
			tilemap_set_mirrored(global.map_id[_plane],$11D,_tile_x,_tile_y); _tile_x-=2; _tile_y++;
			repeat(3) { tilemap_set(global.map_id[_plane],$101,_tile_x,_tile_y); _tile_x++; }
			tilemap_set_mirrored(global.map_id[_plane],$11C,_tile_x,_tile_y); _tile_x++;
			tilemap_set_mirrored(global.map_id[_plane],$11B,_tile_x,_tile_y); _tile_x++;
			tilemap_set_mirrored(global.map_id[_plane],$11A,_tile_x,_tile_y); _tile_x++;
			tilemap_set_mirrored(global.map_id[_plane],$119,_tile_x,_tile_y);
		}
		break;
		//-------------------------------------------------------
		case 133:
		{
			_tile_x+=3;
			repeat(4) { tilemap_set(global.map_id[_plane],$101,_tile_x,_tile_y); _tile_x++; }
			tilemap_set(global.map_id[_plane],$101,_tile_x,_tile_y);
		}
		break;
		//-------------------------------------------------------
		case 135:
		{
			repeat(3) { tilemap_set(global.map_id[_plane],$101,_tile_x,_tile_y); _tile_x++; }
			tilemap_set(global.map_id[_plane],$001,_tile_x,_tile_y); _tile_x-=3; _tile_y++;
			repeat(3) { tilemap_set(global.map_id[_plane],$101,_tile_x,_tile_y); _tile_x++; }
			tilemap_set(global.map_id[_plane],$001,_tile_x,_tile_y);
		}
		break;
		//-------------------------------------------------------
		case 138:
		{
			repeat(3) { tilemap_set(global.map_id[_plane],$101,_tile_x,_tile_y); _tile_x++; }
			tilemap_set(global.map_id[_plane],$101,_tile_x,_tile_y); _tile_x++;
			tilemap_set_mirrored(global.map_id[_plane],$117,_tile_x,_tile_y); _tile_x++;
			tilemap_set_mirrored(global.map_id[_plane],$115,_tile_x,_tile_y); _tile_x++;
			tilemap_set_mirrored(global.map_id[_plane],$11D,_tile_x,_tile_y); _tile_x-=6; _tile_y++;
			repeat(6) { tilemap_set(global.map_id[_plane],$101,_tile_x,_tile_y); _tile_x++; }
			tilemap_set(global.map_id[_plane],$101,_tile_x,_tile_y); _tile_x++;
			tilemap_set_mirrored(global.map_id[_plane],$11E,_tile_x,_tile_y); _tile_y++;
			tilemap_set(global.map_id[_plane],$101,_tile_x,_tile_y);
		}
		break;
		//-------------------------------------------------------
		case 139:
		{
			_tile_y++;
			tilemap_set_mirrored(global.map_id[_plane],$11D,_tile_x,_tile_y); _tile_y++;
			tilemap_set(global.map_id[_plane],$101,_tile_x,_tile_y); _tile_x++;
			tilemap_set_mirrored(global.map_id[_plane],$11E,_tile_x,_tile_y); _tile_x++;
			tilemap_set_mirrored(global.map_id[_plane],$11D,_tile_x,_tile_y); _tile_x--; _tile_y++;
			repeat(2) { tilemap_set(global.map_id[_plane],$101,_tile_x,_tile_y); _tile_x++; }
			tilemap_set_mirrored(global.map_id[_plane],$11E,_tile_x,_tile_y); _tile_x++;
			tilemap_set_mirrored(global.map_id[_plane],$11D,_tile_x,_tile_y); _tile_x--; _tile_y++;
			repeat(2) { tilemap_set(global.map_id[_plane],$101,_tile_x,_tile_y); _tile_x++; }
			tilemap_set_mirrored(global.map_id[_plane],$11C,_tile_x,_tile_y); _tile_x++;
			tilemap_set(global.map_id[_plane],$117,_tile_x,_tile_y); _tile_x++;
			tilemap_set(global.map_id[_plane],$101,_tile_x,_tile_y); _tile_x-=2; _tile_y++;
			repeat(2) { tilemap_set(global.map_id[_plane],$101,_tile_x,_tile_y); _tile_x++; }
			tilemap_set(global.map_id[_plane],$101,_tile_x,_tile_y);
		}
		break;
		//-------------------------------------------------------
		case 142:
		{
			_tile_x+=7; _tile_y++;
			tilemap_set(global.map_id[_plane],$11D,_tile_x,_tile_y); _tile_x-=2; _tile_y++;
			tilemap_set(global.map_id[_plane],$11D,_tile_x,_tile_y); _tile_x++;
			tilemap_set(global.map_id[_plane],$11E,_tile_x,_tile_y); _tile_x++;
			tilemap_set(global.map_id[_plane],$101,_tile_x,_tile_y); _tile_x-=5; _tile_y++;
			tilemap_set(global.map_id[_plane],$11D,_tile_x,_tile_y); _tile_x++;
			tilemap_set(global.map_id[_plane],$115,_tile_x,_tile_y); _tile_x++;
			tilemap_set(global.map_id[_plane],$11E,_tile_x,_tile_y); _tile_x++;
			tilemap_set(global.map_id[_plane],$101,_tile_x,_tile_y); _tile_x++;
			tilemap_set(global.map_id[_plane],$101,_tile_x,_tile_y); _tile_x-=6; _tile_y++;
			repeat(5) { tilemap_set(global.map_id[_plane],$101,_tile_x,_tile_y); _tile_x++; }
			tilemap_set(global.map_id[_plane],$101,_tile_x,_tile_y); _tile_x-=5; _tile_y++;
			tilemap_set(global.map_id[_plane],$101,_tile_x,_tile_y); _tile_x++;
			tilemap_set(global.map_id[_plane],$101,_tile_x,_tile_y);
		}
		break;
		//-------------------------------------------------------
		case 143:
		{
			_tile_x++;
			tilemap_set(global.map_id[_plane],$11D,_tile_x,_tile_y); _tile_x++;
			tilemap_set(global.map_id[_plane],$115,_tile_x,_tile_y); _tile_x++;
			tilemap_set(global.map_id[_plane],$117,_tile_x,_tile_y); _tile_x++;
			repeat(3) { tilemap_set(global.map_id[_plane],$101,_tile_x,_tile_y); _tile_x++; }
			tilemap_set(global.map_id[_plane],$101,_tile_x,_tile_y); _tile_x-=7; _tile_y++;
			tilemap_set(global.map_id[_plane],$11E,_tile_x,_tile_y); _tile_x++;
			repeat(6) { tilemap_set(global.map_id[_plane],$101,_tile_x,_tile_y); _tile_x++; }
			tilemap_set(global.map_id[_plane],$101,_tile_x,_tile_y); _tile_x-=7; _tile_y++;
			tilemap_set(global.map_id[_plane],$101,_tile_x,_tile_y);
		}
		break;
		//-------------------------------------------------------
		case 144:
		{
			_tile_x+=2; _tile_y+=2;
			repeat(5) { tilemap_set(global.map_id[_plane],$101,_tile_x,_tile_y); _tile_x++; }
			tilemap_set(global.map_id[_plane],$101,_tile_x,_tile_y); _tile_x-=5; _tile_y++;
			repeat(5) { tilemap_set(global.map_id[_plane],$101,_tile_x,_tile_y); _tile_x++; }
			tilemap_set(global.map_id[_plane],$101,_tile_x,_tile_y);
		}
		break;
		//-------------------------------------------------------
		case 145:
		{
			_tile_y+=2;
			repeat(5) { tilemap_set(global.map_id[_plane],$101,_tile_x,_tile_y); _tile_x++; }
			tilemap_set(global.map_id[_plane],$101,_tile_x,_tile_y); _tile_x-=5; _tile_y++;
			repeat(5) { tilemap_set(global.map_id[_plane],$101,_tile_x,_tile_y); _tile_x++; }
			tilemap_set(global.map_id[_plane],$101,_tile_x,_tile_y);
		}
		break;
		//-------------------------------------------------------
		case 146:
		{
			repeat(3) { tilemap_set(global.map_id[_plane],$101,_tile_x,_tile_y); _tile_x++; }
			tilemap_set_mirrored(global.map_id[_plane],$117,_tile_x,_tile_y); _tile_x++;
			tilemap_set_mirrored(global.map_id[_plane],$116,_tile_x,_tile_y); _tile_x++;
			tilemap_set_mirrored(global.map_id[_plane],$10A,_tile_x,_tile_y); _tile_x++;
			tilemap_set_mirrored(global.map_id[_plane],$109,_tile_x,_tile_y); _tile_x++;
			tilemap_set(global.map_id[_plane],$113,_tile_x,_tile_y); _tile_x-=7; _tile_y++;
			repeat(7) { tilemap_set(global.map_id[_plane],$101,_tile_x,_tile_y); _tile_x++; }
			tilemap_set(global.map_id[_plane],$101,_tile_x,_tile_y);
		}
		break;
		//-------------------------------------------------------
		case 147:
		{
			tilemap_set(global.map_id[_plane],$113,_tile_x,_tile_y); _tile_x++;
			tilemap_set(global.map_id[_plane],$109,_tile_x,_tile_y); _tile_x++;
			tilemap_set(global.map_id[_plane],$10A,_tile_x,_tile_y); _tile_x++;
			tilemap_set(global.map_id[_plane],$116,_tile_x,_tile_y); _tile_x++;
			tilemap_set(global.map_id[_plane],$117,_tile_x,_tile_y); _tile_x++;
			repeat(2) { tilemap_set(global.map_id[_plane],$101,_tile_x,_tile_y); _tile_x++; }
			tilemap_set(global.map_id[_plane],$101,_tile_x,_tile_y); _tile_x-=7; _tile_y++;
			repeat(7) { tilemap_set(global.map_id[_plane],$101,_tile_x,_tile_y); _tile_x++; }
			tilemap_set(global.map_id[_plane],$101,_tile_x,_tile_y);
		}
		break;
		//-------------------------------------------------------
		case 150:
		{
			repeat(2) {
			repeat(4) { tilemap_set(global.map_id[_plane],$101,_tile_x,_tile_y); _tile_x++; }
			tilemap_set(global.map_id[_plane],$101,_tile_x,_tile_y); _tile_x-=4; _tile_y++; } _tile_y+=2;
			tilemap_set(global.map_id[_plane],$109,_tile_x,_tile_y); _tile_x++;
			tilemap_set(global.map_id[_plane],$10A,_tile_x,_tile_y); _tile_x++;
			tilemap_set(global.map_id[_plane],$116,_tile_x,_tile_y); _tile_x++;
			tilemap_set(global.map_id[_plane],$117,_tile_x,_tile_y); _tile_x++;
			repeat(2) { tilemap_set(global.map_id[_plane],$101,_tile_x,_tile_y); _tile_x++; }
			tilemap_set_mirrored(global.map_id[_plane],$117,_tile_x,_tile_y); _tile_x++;
			tilemap_set_mirrored(global.map_id[_plane],$116,_tile_x,_tile_y); _tile_x-=7; _tile_y++;
			repeat(7) { tilemap_set(global.map_id[_plane],$101,_tile_x,_tile_y); _tile_x++; }
			tilemap_set(global.map_id[_plane],$101,_tile_x,_tile_y);
		}
		break;
		//-------------------------------------------------------
		case 151:
		{
			_tile_y+=4;
			repeat(2) { tilemap_set_mirrored(global.map_id[_plane],$115,_tile_x,_tile_y); _tile_x++; }
			tilemap_set(global.map_id[_plane],$115,_tile_x,_tile_y); _tile_x++;
			tilemap_set(global.map_id[_plane],$116,_tile_x,_tile_y); _tile_x++;
			tilemap_set(global.map_id[_plane],$117,_tile_x,_tile_y); _tile_x++;
			repeat(2) { tilemap_set(global.map_id[_plane],$101,_tile_x,_tile_y); _tile_x++; }
			tilemap_set(global.map_id[_plane],$101,_tile_x,_tile_y); _tile_x-=7; _tile_y++;
			repeat(7) { tilemap_set(global.map_id[_plane],$101,_tile_x,_tile_y); _tile_x++; }
			tilemap_set(global.map_id[_plane],$101,_tile_x,_tile_y);
		}
		break;
		//-------------------------------------------------------
		case 154:
		{
			repeat(2) {
			repeat(7) { tilemap_set(global.map_id[_plane],$101,_tile_x,_tile_y); _tile_x++; }
			tilemap_set(global.map_id[_plane],$101,_tile_x,_tile_y); _tile_x-=7; _tile_y++; } _tile_y+=2;
			tilemap_set(global.map_id[_plane],$101,_tile_x,_tile_y); _tile_x++;
			tilemap_set_mirrored(global.map_id[_plane],$117,_tile_x,_tile_y); _tile_x++;
			tilemap_set_mirrored(global.map_id[_plane],$116,_tile_x,_tile_y); _tile_x++;
			repeat(2) { tilemap_set_mirrored(global.map_id[_plane],$10A,_tile_x,_tile_y); _tile_x++; }
			tilemap_set(global.map_id[_plane],$109,_tile_x,_tile_y); _tile_x++;
			tilemap_set(global.map_id[_plane],$10A,_tile_x,_tile_y); _tile_x++;
			tilemap_set(global.map_id[_plane],$116,_tile_x,_tile_y); _tile_x-=7; _tile_y++;
			repeat(7) { tilemap_set(global.map_id[_plane],$101,_tile_x,_tile_y); _tile_x++; }
			tilemap_set(global.map_id[_plane],$101,_tile_x,_tile_y);
		}
		break;
		//-------------------------------------------------------
		case 155:
		{
			repeat(2) { tilemap_set(global.map_id[_plane],$101,_tile_x,_tile_y); _tile_x++;
			tilemap_set(global.map_id[_plane],$101,_tile_x,_tile_y); _tile_x--; _tile_y++; } _tile_y+=2;
			tilemap_set(global.map_id[_plane],$117,_tile_x,_tile_y); _tile_x++;
			repeat(2) { tilemap_set(global.map_id[_plane],$101,_tile_x,_tile_y); _tile_x++; }
			tilemap_set_mirrored(global.map_id[_plane],$117,_tile_x,_tile_y); _tile_x++;
			tilemap_set_mirrored(global.map_id[_plane],$116,_tile_x,_tile_y); _tile_x++;
			tilemap_set_mirrored(global.map_id[_plane],$115,_tile_x,_tile_y); _tile_x++;
			tilemap_set(global.map_id[_plane],$115,_tile_x,_tile_y); _tile_x++;
			tilemap_set(global.map_id[_plane],$115,_tile_x,_tile_y); _tile_x-=7; _tile_y++;
			repeat(7) { tilemap_set(global.map_id[_plane],$101,_tile_x,_tile_y); _tile_x++; }
			tilemap_set(global.map_id[_plane],$101,_tile_x,_tile_y);
		}
		break;
		//-------------------------------------------------------
		case 158:
		{
			_tile_y+=4;
			tilemap_set(global.map_id[_plane],$115,_tile_x,_tile_y); _tile_x++;
			tilemap_set(global.map_id[_plane],$116,_tile_x,_tile_y); _tile_x++;
			tilemap_set(global.map_id[_plane],$117,_tile_x,_tile_y); _tile_x++;
			repeat(4) { tilemap_set(global.map_id[_plane],$101,_tile_x,_tile_y); _tile_x++; }
			tilemap_set_mirrored(global.map_id[_plane],$117,_tile_x,_tile_y); _tile_x-=7; _tile_y++;
			repeat(7) { tilemap_set(global.map_id[_plane],$101,_tile_x,_tile_y); _tile_x++; }
			tilemap_set(global.map_id[_plane],$101,_tile_x,_tile_y);
		}
		break;
		//-------------------------------------------------------
		case 159:
		{
			_tile_y+=4;
			tilemap_set_mirrored(global.map_id[_plane],$116,_tile_x,_tile_y); _tile_x++;
			tilemap_set_mirrored(global.map_id[_plane],$115,_tile_x,_tile_y); _tile_x++;
			tilemap_set_mirrored(global.map_id[_plane],$115,_tile_x,_tile_y); _tile_x++;
			repeat(2) { tilemap_set(global.map_id[_plane],$115,_tile_x,_tile_y); _tile_x++; }
			tilemap_set(global.map_id[_plane],$116,_tile_x,_tile_y); _tile_x++;
			tilemap_set(global.map_id[_plane],$117,_tile_x,_tile_y); _tile_x++;
			tilemap_set(global.map_id[_plane],$101,_tile_x,_tile_y); _tile_x-=7; _tile_y++;
			repeat(7) { tilemap_set(global.map_id[_plane],$101,_tile_x,_tile_y); _tile_x++; }
			tilemap_set(global.map_id[_plane],$101,_tile_x,_tile_y);
		}
		break;
		//-------------------------------------------------------
		case 160:
		{
			_tile_x++;
			tilemap_set(global.map_id[_plane],$111,_tile_x,_tile_y); _tile_x++;
			tilemap_set_mirrored(global.map_id[_plane],$111,_tile_x,_tile_y); _tile_x-=2; _tile_y++;
			repeat(3) { tilemap_set(global.map_id[_plane],$101,_tile_x,_tile_y); _tile_x++; }
			tilemap_set(global.map_id[_plane],$101,_tile_x,_tile_y); _tile_x-=3; _tile_y++;
			repeat(3) { tilemap_set(global.map_id[_plane],$101,_tile_x,_tile_y); _tile_x++; }
			tilemap_set(global.map_id[_plane],$101,_tile_x,_tile_y);
		}
		break;
		//-------------------------------------------------------
		case 163:
		{
			_tile_x+=5; _tile_y++;
			tilemap_set(global.map_id[_plane],$119,_tile_x,_tile_y); _tile_x++;
			tilemap_set(global.map_id[_plane],$11A,_tile_x,_tile_y); _tile_x++;
			tilemap_set(global.map_id[_plane],$11B,_tile_x,_tile_y); _tile_x-=3; _tile_y++;
			tilemap_set(global.map_id[_plane],$001,_tile_x,_tile_y); _tile_x++;
			repeat(2) { tilemap_set(global.map_id[_plane],$101,_tile_x,_tile_y); _tile_x++; }
			tilemap_set(global.map_id[_plane],$101,_tile_x,_tile_y); _tile_x-=3; _tile_y++;
			repeat(4) { tilemap_set(global.map_id[_plane],$001,_tile_x,_tile_y); _tile_y++; }
			tilemap_set(global.map_id[_plane],$001,_tile_x,_tile_y);
		}
		break;
		//-------------------------------------------------------
		case 164:
		{
			_tile_x++;
			tilemap_set(global.map_id[_plane],$11D,_tile_x,_tile_y); _tile_x++;
			tilemap_set(global.map_id[_plane],$11E,_tile_x,_tile_y); _tile_x++;
			tilemap_set(global.map_id[_plane],$101,_tile_x,_tile_y); _tile_x++;
			tilemap_set_mirrored(global.map_id[_plane],$117,_tile_x,_tile_y); _tile_x++;
			tilemap_set(global.map_id[_plane],$117,_tile_x,_tile_y); _tile_x++;
			tilemap_set(global.map_id[_plane],$101,_tile_x,_tile_y); _tile_x++;
			tilemap_set(global.map_id[_plane],$001,_tile_x,_tile_y); _tile_x-=7; _tile_y++;
			tilemap_set(global.map_id[_plane],$11C,_tile_x,_tile_y); _tile_x++;
			repeat(6) { tilemap_set(global.map_id[_plane],$101,_tile_x,_tile_y); _tile_x++; }
			tilemap_set(global.map_id[_plane],$001,_tile_x,_tile_y); _tile_x-=7; _tile_y++;
			tilemap_set(global.map_id[_plane],$101,_tile_x,_tile_y); _tile_x+=7;
			repeat(5) { tilemap_set(global.map_id[_plane],$001,_tile_x,_tile_y); }
			tilemap_set(global.map_id[_plane],$001,_tile_x,_tile_y);
		}
		break;
		//-------------------------------------------------------
		case 167:
		{
			_tile_y+=4;
			tilemap_set(global.map_id[_plane],$101,_tile_x,_tile_y); _tile_x++;
			tilemap_set_mirrored(global.map_id[_plane],$117,_tile_x,_tile_y); _tile_x++;
			tilemap_set_mirrored(global.map_id[_plane],$116,_tile_x,_tile_y); _tile_x++;
			tilemap_set_mirrored(global.map_id[_plane],$11B,_tile_x,_tile_y); _tile_x++;
			tilemap_set(global.map_id[_plane],$115,_tile_x,_tile_y); _tile_x++;
			tilemap_set(global.map_id[_plane],$116,_tile_x,_tile_y); _tile_x++;
			tilemap_set(global.map_id[_plane],$117,_tile_x,_tile_y); _tile_x++;
			tilemap_set(global.map_id[_plane],$117,_tile_x,_tile_y); _tile_x-=7; _tile_y++;
			repeat(7) { tilemap_set(global.map_id[_plane],$101,_tile_x,_tile_y); _tile_x++; }
			tilemap_set(global.map_id[_plane],$101,_tile_x,_tile_y);
		}
		break;
		//-------------------------------------------------------
		case 178:
		{
			_tile_x+=6; _tile_y+=3;
			tilemap_set(global.map_id[_plane],$11D,_tile_x,_tile_y); _tile_x++;
			tilemap_set(global.map_id[_plane],$11E,_tile_x,_tile_y); _tile_x-=7; _tile_y++;
			tilemap_set(global.map_id[_plane],$101,_tile_x,_tile_y); _tile_x++;
			tilemap_set_mirrored(global.map_id[_plane],$117,_tile_x,_tile_y); _tile_x++;
			tilemap_set_mirrored(global.map_id[_plane],$11B,_tile_x,_tile_y); _tile_x++;
			tilemap_set(global.map_id[_plane],$115,_tile_x,_tile_y); _tile_x++;
			tilemap_set(global.map_id[_plane],$11B,_tile_x,_tile_y); _tile_x++;
			tilemap_set(global.map_id[_plane],$11C,_tile_x,_tile_y); _tile_x++;
			tilemap_set(global.map_id[_plane],$101,_tile_x,_tile_y); _tile_x++;
			tilemap_set(global.map_id[_plane],$101,_tile_x,_tile_y); _tile_x-=7; _tile_y++;
			repeat(5) { tilemap_set(global.map_id[_plane],$101,_tile_x,_tile_y); _tile_x++; }
			tilemap_set(global.map_id[_plane],$101,_tile_x,_tile_y);
		}
		break;
		//-------------------------------------------------------
		case 179:
		{
			_tile_x+=4;
			tilemap_set(global.map_id[_plane],$11D,_tile_x,_tile_y); _tile_x++;
			tilemap_set(global.map_id[_plane],$115,_tile_x,_tile_y); _tile_x++;
			tilemap_set(global.map_id[_plane],$117,_tile_x,_tile_y); _tile_x++;
			tilemap_set(global.map_id[_plane],$101,_tile_x,_tile_y); _tile_x-=5; _tile_y++;
			tilemap_set(global.map_id[_plane],$11D,_tile_x,_tile_y); _tile_x++;
			tilemap_set(global.map_id[_plane],$11E,_tile_x,_tile_y); _tile_x++;
			repeat(3) { tilemap_set(global.map_id[_plane],$101,_tile_x,_tile_y); _tile_x++; }
			tilemap_set(global.map_id[_plane],$101,_tile_x,_tile_y); _tile_x-=7; _tile_y++;
			tilemap_set(global.map_id[_plane],$11D,_tile_x,_tile_y); _tile_x++;
			tilemap_set(global.map_id[_plane],$11E,_tile_x,_tile_y); _tile_x++;
			tilemap_set(global.map_id[_plane],$101,_tile_x,_tile_y); _tile_x++;
			tilemap_set(global.map_id[_plane],$101,_tile_x,_tile_y); _tile_x-=3; _tile_y++;
			tilemap_set(global.map_id[_plane],$101,_tile_x,_tile_y); _tile_x++;
			tilemap_set(global.map_id[_plane],$101,_tile_x,_tile_y);
		}
		break;
		//-------------------------------------------------------
		case 180:
		{
			_tile_x+=7; _tile_y++;
			repeat(6) { tilemap_set(global.map_id[_plane],$001,_tile_x,_tile_y); _tile_y++; }
			tilemap_set(global.map_id[_plane],$001,_tile_x,_tile_y); _tile_x--;
			tilemap_set_flipped(global.map_id[_plane],$6D,_tile_x,_tile_y);
		}
		break;
		//-------------------------------------------------------
		case 181:
		{
			_tile_x++;
			tilemap_set(global.map_id[_plane],$111,_tile_x,_tile_y); _tile_x++;
			tilemap_set(global.map_id[_plane],$112,_tile_x,_tile_y); _tile_x++;
			repeat(2) { tilemap_set_mirrored(global.map_id[_plane],$112,_tile_x,_tile_y); _tile_x++; }
			tilemap_set_mirrored(global.map_id[_plane],$111,_tile_x,_tile_y); _tile_x-=5; _tile_y++;
			tilemap_set(global.map_id[_plane],$001,_tile_x,_tile_y); _tile_x++;
			repeat(5) { tilemap_set(global.map_id[_plane],$101,_tile_x,_tile_y); _tile_x++; }
			tilemap_set(global.map_id[_plane],$101,_tile_x,_tile_y); _tile_x-=7; _tile_y++;
			tilemap_set(global.map_id[_plane],$001,_tile_x,_tile_y); _tile_x+=6;
			tilemap_set(global.map_id[_plane],$101,_tile_x,_tile_y); _tile_x++;
			tilemap_set(global.map_id[_plane],$101,_tile_x,_tile_y); _tile_x-=7; _tile_y++;
			repeat(4) { tilemap_set(global.map_id[_plane],$001,_tile_x,_tile_y); _tile_y++; }
		}
		break;
		//-------------------------------------------------------
		case 182:
		{
			_tile_x+=6;
			tilemap_set(global.map_id[_plane],$96,_tile_x,_tile_y); _tile_x++;
			tilemap_set(global.map_id[_plane],$001,_tile_x,_tile_y); _tile_x--; _tile_y++;
			tilemap_set(global.map_id[_plane],$95,_tile_x,_tile_y); _tile_x++;
			tilemap_set(global.map_id[_plane],$001,_tile_x,_tile_y); _tile_x-=2; _tile_y++;
			tilemap_set(global.map_id[_plane],$94,_tile_x,_tile_y); _tile_x++;
			tilemap_set(global.map_id[_plane],$001,_tile_x,_tile_y); _tile_x-=4; _tile_y++;
			tilemap_set_flipped(global.map_id[_plane],$173,_tile_x,_tile_y); _tile_x++;
			tilemap_set_flipped(global.map_id[_plane],$172,_tile_x,_tile_y); _tile_x++;
			tilemap_set_flipped(global.map_id[_plane],$171,_tile_x,_tile_y); _tile_x++;
			tilemap_set(global.map_id[_plane],$001,_tile_x,_tile_y); _tile_x++;
			tilemap_set(global.map_id[_plane],$001,_tile_x,_tile_y); _tile_x-=6; _tile_y++;
			repeat(3) { tilemap_set(global.map_id[_plane],$101,_tile_x,_tile_y); _tile_x++; }
			tilemap_set(global.map_id[_plane],$101,_tile_x,_tile_y);_tile_x-=3; _tile_y++;
			repeat(2) { tilemap_set(global.map_id[_plane],$101,_tile_x,_tile_y); _tile_x++; }
		}
		break;
		//-------------------------------------------------------
		case 184:
		{
			repeat(8) { tilemap_set(global.map_id[_plane],$10E,_tile_x,_tile_y); _tile_x++; }
		}
		break;
		//-------------------------------------------------------
		// Loop tiles--------------------------------------------
		case 187:
		{
			repeat(7) { tilemap_set(global.map_id[_plane],$001,_tile_x,_tile_y); _tile_x++; }
			tilemap_set(global.map_id[_plane],$001,_tile_x,_tile_y); _tile_x-=7; _tile_y++;
			repeat(5) { tilemap_set(global.map_id[_plane],$001,_tile_x,_tile_y); _tile_x++; }
			tilemap_set_xy_flipped(global.map_id[_plane],$93,_tile_x,_tile_y); _tile_x++;
			tilemap_set_xy_flipped(global.map_id[_plane],$92,_tile_x,_tile_y); _tile_x++;
			tilemap_set_xy_flipped(global.map_id[_plane],$7B,_tile_x,_tile_y);
			if (_plane == 1) {
				_tile_x-=4; _tile_y++;
				tilemap_set(global.map_id[_plane],$001,_tile_x,_tile_y); _tile_x++;
				tilemap_set_xy_flipped(global.map_id[_plane],$94,_tile_x,_tile_y); _tile_x-=2; _tile_y++;
				tilemap_set(global.map_id[_plane],$001,_tile_x,_tile_y); _tile_x++;
				tilemap_set_xy_flipped(global.map_id[_plane],$95,_tile_x,_tile_y); _tile_x--; _tile_y++;
				tilemap_set(global.map_id[_plane],$001,_tile_x,_tile_y); _tile_x++;
				tilemap_set_xy_flipped(global.map_id[_plane],$96,_tile_x,_tile_y); _tile_x--; _tile_y++;
				tilemap_set(global.map_id[_plane],$001,_tile_x,_tile_y); _tile_x++;
				tilemap_set_xy_flipped(global.map_id[_plane],$97,_tile_x,_tile_y); _tile_x--; _tile_y++;
				tilemap_set(global.map_id[_plane],$001,_tile_x,_tile_y); _tile_x++;
				tilemap_set_mirrored(global.map_id[_plane],$97,_tile_x,_tile_y); _tile_x--; _tile_y++;
				tilemap_set(global.map_id[_plane],$001,_tile_x,_tile_y); _tile_x++;
				tilemap_set_mirrored(global.map_id[_plane],$96,_tile_x,_tile_y);
			}
		}
		break;
		//-------------------------------------------------------
		case 188:
		{
			repeat(7) { tilemap_set(global.map_id[_plane],$001,_tile_x,_tile_y); _tile_x++; }
			tilemap_set(global.map_id[_plane],$001,_tile_x,_tile_y); _tile_x-=7; _tile_y++;
			tilemap_set_flipped(global.map_id[_plane],$7B,_tile_x,_tile_y); _tile_x++;
			tilemap_set_flipped(global.map_id[_plane],$92,_tile_x,_tile_y); _tile_x++;
			tilemap_set_flipped(global.map_id[_plane],$93,_tile_x,_tile_y); _tile_x++;
			repeat(4) { tilemap_set(global.map_id[_plane],$001,_tile_x,_tile_y); _tile_x++; }
			tilemap_set(global.map_id[_plane],$001,_tile_x,_tile_y);
			if (_plane == 0) {
				_tile_x-=4; _tile_y++;
				tilemap_set_flipped(global.map_id[_plane],$94,_tile_x,_tile_y); _tile_x++;
				tilemap_set(global.map_id[_plane],$001,_tile_x,_tile_y); _tile_y++;
				tilemap_set_flipped(global.map_id[_plane],$95,_tile_x,_tile_y); _tile_x++;
				tilemap_set(global.map_id[_plane],$001,_tile_x,_tile_y); _tile_x--; _tile_y++;
				tilemap_set_flipped(global.map_id[_plane],$96,_tile_x,_tile_y); _tile_x++;
				tilemap_set(global.map_id[_plane],$001,_tile_x,_tile_y); _tile_x--; _tile_y++;
				tilemap_set_flipped(global.map_id[_plane],$97,_tile_x,_tile_y); _tile_x++; 
				tilemap_set(global.map_id[_plane],$001,_tile_x,_tile_y); _tile_x--; _tile_y++;
				tilemap_set(global.map_id[_plane],$97,_tile_x,_tile_y); _tile_x++;
				tilemap_set(global.map_id[_plane],$001,_tile_x,_tile_y); _tile_x--; _tile_y++;
				tilemap_set(global.map_id[_plane],$96,_tile_x,_tile_y); _tile_x++;
				tilemap_set(global.map_id[_plane],$001,_tile_x,_tile_y); }
		}
		break;
		//-------------------------------------------------------
		case 189:
		{
			_tile_y+=4;
			repeat(7) { tilemap_set(global.map_id[_plane],$001,_tile_x,_tile_y); _tile_x++; }
			tilemap_set(global.map_id[_plane],$001,_tile_x,_tile_y); _tile_x-=7; _tile_y++;
			repeat(7) { tilemap_set(global.map_id[_plane],$001,_tile_x,_tile_y); _tile_x++; }
			tilemap_set(global.map_id[_plane],$001,_tile_x,_tile_y);
			if (_plane == 0) {
				_tile_x-=3; _tile_y-=2;
				tilemap_set(global.map_id[_plane],$98,_tile_x,_tile_y); _tile_x++;
				tilemap_set(global.map_id[_plane],$99,_tile_x,_tile_y); _tile_x++;
				tilemap_set(global.map_id[_plane],$9A,_tile_x,_tile_y); _tile_x++;
				tilemap_set(global.map_id[_plane],$9B,_tile_x,_tile_y); }
			else if (_plane == 1) {
				_tile_x-=5; _tile_y-=5;
				tilemap_set(global.map_id[_plane],$001,_tile_x,_tile_y); _tile_x++;
				tilemap_set_mirrored(global.map_id[_plane],$95,_tile_x,_tile_y); _tile_y++;
				tilemap_set(global.map_id[_plane],$001,_tile_x,_tile_y); _tile_x++;
				tilemap_set_mirrored(global.map_id[_plane],$A0,_tile_x,_tile_y); _tile_y++;
				tilemap_set(global.map_id[_plane],$001,_tile_x,_tile_y); _tile_x++;
				tilemap_set_mirrored(global.map_id[_plane],$9F,_tile_x,_tile_y); _tile_x++;
				tilemap_set_mirrored(global.map_id[_plane],$9E,_tile_x,_tile_y); _tile_x-=2; _tile_y++;
				tilemap_set(global.map_id[_plane],$001,_tile_x,_tile_y); _tile_x++;
				tilemap_set(global.map_id[_plane],$001,_tile_x,_tile_y); _tile_x++;
				tilemap_set_mirrored(global.map_id[_plane],$9D,_tile_x,_tile_y); _tile_x++;
				tilemap_set_mirrored(global.map_id[_plane],$9C,_tile_x,_tile_y); }
		}
		break;
		//-------------------------------------------------------
		case 190:
		{
			_tile_y+=4;
			repeat(7) { tilemap_set(global.map_id[_plane],$001,_tile_x,_tile_y); _tile_x++; }
			tilemap_set(global.map_id[_plane],$001,_tile_x,_tile_y); _tile_x-=7; _tile_y++;
			repeat(7) { tilemap_set(global.map_id[_plane],$001,_tile_x,_tile_y); _tile_x++; }
			tilemap_set(global.map_id[_plane],$001,_tile_x,_tile_y);
			if (_plane == 0) {
				_tile_y-=5; _tile_x-=2;
				tilemap_set(global.map_id[_plane],$001,_tile_x,_tile_y); _tile_x--;
				tilemap_set(global.map_id[_plane],$95,_tile_x,_tile_y); _tile_y++;
				tilemap_set(global.map_id[_plane],$001,_tile_x,_tile_y); _tile_x--;
				tilemap_set(global.map_id[_plane],$94,_tile_x,_tile_y); _tile_y++;
				tilemap_set(global.map_id[_plane],$001,_tile_x,_tile_y); _tile_x--;
				tilemap_set(global.map_id[_plane],$9F,_tile_x,_tile_y); _tile_x--;
				tilemap_set(global.map_id[_plane],$9E,_tile_x,_tile_y); _tile_x+=2; _tile_y++;
				tilemap_set(global.map_id[_plane],$001,_tile_x,_tile_y); _tile_x--;
				tilemap_set(global.map_id[_plane],$001,_tile_x,_tile_y); _tile_x--;
				tilemap_set(global.map_id[_plane],$9D,_tile_x,_tile_y); _tile_x--;
				tilemap_set(global.map_id[_plane],$9C,_tile_x,_tile_y);
			}
			else if (_plane == 1) {
				_tile_x-=7; _tile_y-=2;
				tilemap_set_mirrored(global.map_id[_plane],$9B,_tile_x,_tile_y); _tile_x++;
				tilemap_set_mirrored(global.map_id[_plane],$9A,_tile_x,_tile_y); _tile_x++;
				tilemap_set_mirrored(global.map_id[_plane],$99,_tile_x,_tile_y); _tile_x++;
				tilemap_set_mirrored(global.map_id[_plane],$98,_tile_x,_tile_y);
			}
		}
		break;
		//-------------------------------------------------------
		//-------------------------------------------------------						
		case 192:
		{
			_tile_y+=4;
			repeat(3) { tilemap_set(global.map_id[_plane],$101,_tile_x,_tile_y); _tile_x++; }
			tilemap_set(global.map_id[_plane],$101,_tile_x,_tile_y); _tile_x-=3; _tile_y++;
			repeat(3) { tilemap_set(global.map_id[_plane],$101,_tile_x,_tile_y); _tile_x++; }
			tilemap_set(global.map_id[_plane],$101,_tile_x,_tile_y);
		}
		break;
		//-------------------------------------------------------			
		case 194:
		{
			_tile_x+=4;
			repeat(3) { tilemap_set(global.map_id[_plane],$101,_tile_x,_tile_y); _tile_x++; }
			tilemap_set(global.map_id[_plane],$101,_tile_x,_tile_y); _tile_x-=3; _tile_y++;
			repeat(3) { tilemap_set(global.map_id[_plane],$101,_tile_x,_tile_y); _tile_x++; }
			tilemap_set(global.map_id[_plane],$101,_tile_x,_tile_y);
		}
		break;
		//-------------------------------------------------------
		default:
		break;
	}
}