/*
 * accOrientation.h
 *
 *  Created on: 27 de set de 2022
 *      Author: Roger Moschiel
 */

#ifndef ACC_ORIENTATION_H_
#define ACC_ORIENTATION_H_

//describe any vector
typedef struct {
	float X;
	float Y;
	float Z;
} Vector;

//describe orientation vectors
typedef struct {
	Vector vUp;
	Vector vFront;
	Vector vRight;
} Orientation;

//describe the magnitude of the components of a vector in every direction of the orientation
typedef struct {
	float UP;
	float FRONT;
	float RIGHT;
} OrientationMagnitude;

void findOrientation(Vector *vUp, Vector *vUpFront, Orientation *orientation);
void findVectorComponentsInTheOrientation(Vector *v, Orientation *orientation, Orientation *vComponents);
void findVectorsMagnitudeInTheOrientation(Vector *v, Orientation *orientation, OrientationMagnitude *g);

#endif /* ACC_ORIENTATION_H_ */