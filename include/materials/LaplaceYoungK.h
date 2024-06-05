#pragma once

#include "Material.h"

class LaplaceYoungK : public Material
{
public:
  static InputParameters validParams();

  LaplaceYoungK(const InputParameters & parameters);

protected:
  /// Necessary override. This is where the values of the properties are computed.
  virtual void computeQpProperties() override;

  /// The value of k
  ADMaterialProperty<Real> & _k;

  /// The gradient of u
  const ADVariableGradient & _grad_u;
};
