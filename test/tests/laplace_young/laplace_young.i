[Mesh]
  type = GeneratedMesh
  dim = 2
  nx = 10
  ny = 10
[]

[Variables]
  [u]
  []
[]

[Kernels]
  [diff]
    type = ADMatDiffusion
    variable = u
    diffusivity = k
  []
  [react]
    type = ADReaction
    variable = u
  []
[]

[Materials/k]
  type = LaplaceYoungK
  u = u
[]

[BCs/neumann]
  type = ADNeumannBC
  variable = u
  boundary = 'top right bottom left'
  value = 0.2
[]

[Executioner]
  type = Steady
  solve_type = 'PJFNK'
  petsc_options_iname = '-pc_type -pc_hypre_type'
  petsc_options_value = 'hypre boomeramg'
[]

[Outputs]
  exodus = true
[]
