#version 460 core

precision mediump float;

#include <flutter/runtime_effect.glsl>

uniform float u_time;
uniform vec2 u_resolution;

out vec4 fragColor;

void main() {
    vec2 uv = FlutterFragCoord().xy / u_resolution;
    fragColor = vec4(uv.x, uv.y, abs(sin(u_time)), 1.0);
}
