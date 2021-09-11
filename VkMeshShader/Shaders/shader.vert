#version 450

struct Vertex
{
    vec2 Position;
    vec3 Color;
};

layout(binding = 0) uniform UniformBufferObject 
{
    mat4 model;
    mat4 view;
    mat4 proj;
} ubo;

layout(binding = 1) readonly buffer Vertices
{
	Vertex vertices[];
} g_Vertex;


layout(location = 0) out vec3 fragColor;

void main()
{
    gl_Position = ubo.proj * ubo.view * ubo.model * vec4(g_Vertex.vertices[gl_VertexIndex].Position, 0.0, 1.0);
    fragColor = vec3(1.0f);// vertices[gl_VertexIndex].Color;
}