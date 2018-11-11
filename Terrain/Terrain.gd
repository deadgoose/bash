#MIT License
#
#Copyright (c) 2018 KidsCanCode
#
#Permission is hereby granted, free of charge, to any person obtaining a copy
#of this software and associated documentation files (the "Software"), to deal
#in the Software without restriction, including without limitation the rights
#to use, copy, modify, merge, publish, distribute, sublicense, and/or sell
#copies of the Software, and to permit persons to whom the Software is
#furnished to do so, subject to the following conditions:
#
#The above copyright notice and this permission notice shall be included in all
#copies or substantial portions of the Software.
#
#THE SOFTWARE IS PROVIDED "AS IS", WITHOUT WARRANTY OF ANY KIND, EXPRESS OR
#IMPLIED, INCLUDING BUT NOT LIMITED TO THE WARRANTIES OF MERCHANTABILITY,
#FITNESS FOR A PARTICULAR PURPOSE AND NONINFRINGEMENT. IN NO EVENT SHALL THE
#AUTHORS OR COPYRIGHT HOLDERS BE LIABLE FOR ANY CLAIM, DAMAGES OR OTHER
#LIABILITY, WHETHER IN AN ACTION OF CONTRACT, TORT OR OTHERWISE, ARISING FROM,
#OUT OF OR IN CONNECTION WITH THE SOFTWARE OR THE USE OR OTHER DEALINGS IN THE
#SOFTWARE.
#https://github.com/kidscancode/godot3_procgen_demos/blob/master/part04/Godot3_2Dterrain1/Line2D.gd
extends Line2D

export (int) var displacement = 100
export var iterations = 5
export (int) var height = 350
export (float) var smooth = 1.1
export (int) var left_start = 0
export (int) var right_end
var current_displacement

func _ready():
	$Polygon2D.color = default_color
	
func flat_line():
	print(height)
	var screensize = get_viewport().get_visible_rect().size
	if not right_end:
		print("no right end")
		right_end = screensize.x
	var start = Vector2(0, height)
	var end = Vector2(right_end, height)
	points = PoolVector2Array()
	add_point(start)
	add_point(end)
	var p = points
	p.append(Vector2(right_end, screensize.y))
	p.append(Vector2(0, screensize.y))
	$Polygon2D.polygon = p
	$Area2D/CollisionPolygon2D.polygon = p
	
func init_line():
	current_displacement = displacement
	var screensize = get_viewport().get_visible_rect().size
	if not right_end:
		print("no right end")
		right_end = screensize.x
	points = PoolVector2Array()
	var start = Vector2(left_start, rand_range(height-displacement,
								height+displacement))
	var end = Vector2(right_end, rand_range(height-displacement,
								height+displacement))
	add_point(start)
	add_point(end)
	for i in range(iterations):
		add_points()
	var p = points
	p.append(Vector2(right_end, screensize.y))
	p.append(Vector2(left_start, screensize.y))
	$Polygon2D.polygon = p
	$Area2D/CollisionPolygon2D.polygon = p
	
func random_one():
	return [-1, 1][randi() % 2]
	
func add_points():
	var old_points = points
	points = PoolVector2Array()
	for i in range(old_points.size() - 1):
		var midpoint = (old_points[i] + old_points[i+1]) / 2
		midpoint.y += current_displacement * random_one()
		add_point(old_points[i])
		add_point(midpoint)
	add_point(old_points[old_points.size() - 1])
	current_displacement *= pow(2.0, -smooth)
