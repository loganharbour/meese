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
  k = k
  u = u
[]

[BCs]
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
