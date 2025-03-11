#ifndef TRANSFORMATIONS_H
#define TRANSFORMATIONS_H

#include <DirectXMath.h>

using namespace DirectX;

class Transformations {
public:
    // Rotación alrededor del eje X
    static XMMATRIX RotateX(float angle) {
        return XMMatrixRotationX(angle);
    }

    // Rotación alrededor del eje Y
    static XMMATRIX RotateY(float angle) {
        return XMMatrixRotationY(angle);
    }

    // Rotación alrededor del eje Z
    static XMMATRIX RotateZ(float angle) {
        return XMMatrixRotationZ(angle);
    }

    // Traslación
    static XMMATRIX Translate(float x, float y, float z) {
        return XMMatrixTranslation(x, y, z);
    }

    // Escalado
    static XMMATRIX Scale(float x, float y, float z) {
        return XMMatrixScaling(x, y, z);
    }

    // Combinación de transformaciones: rotación, traslación y escalado
    static XMMATRIX Transform(float tx, float ty, float tz, float sx, float sy, float sz, float rx, float ry, float rz) {
        XMMATRIX translationMatrix = Translate(tx, ty, tz);
        XMMATRIX scalingMatrix = Scale(sx, sy, sz);
        XMMATRIX rotationMatrixX = RotateX(rx);
        XMMATRIX rotationMatrixY = RotateY(ry);
        XMMATRIX rotationMatrixZ = RotateZ(rz);

        // Combinación de las transformaciones
        return scalingMatrix * rotationMatrixX * rotationMatrixY * rotationMatrixZ * translationMatrix;
    }
};

#endif // TRANSFORMATIONS_H
