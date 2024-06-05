#include "LaplaceYoungK.h"

registerMooseObject("MeeseApp", LaplaceYoungK);

InputParameters
LaplaceYoungK::validParams()
{
  InputParameters params = Material::validParams();
  params.addParam<MaterialPropertyName>("k", "k", "The name of the property for k");
  params.addRequiredCoupledVar("u", "The variable to take the gradient of");
  return params;
}

LaplaceYoungK::LaplaceYoungK(const InputParameters & parameters)
  : Material(parameters),
    _k(declareADProperty<Real>(getParam<MaterialPropertyName>("k"))),
    _grad_u(adCoupledGradient("u"))
{
}

void
LaplaceYoungK::computeQpProperties()
{
  _k[_qp] = 1.0 / std::sqrt(1 + _grad_u[_qp] * _grad_u[_qp]);
}
