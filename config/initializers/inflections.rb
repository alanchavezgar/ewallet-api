# Be sure to restart your server when you modify this file.

# Add new inflection rules using the following format. Inflections
# are locale specific, and you may define rules for as many different
# locales as you wish. All of these examples are active by default:
# ActiveSupport::Inflector.inflections(:en) do |inflect|
#   inflect.plural /^(ox)$/i, '\1en'
#   inflect.singular /^(ox)en/i, '\1'
#   inflect.irregular 'person', 'people'
#   inflect.uncountable %w( fish sheep )
# end

ActiveSupport::Inflector.inflections('es-MX') do |inflect|
  # Sistema
  inflect.irregular 'usuario', 'usuarios'

  # Finanzas
  inflect.irregular 'transaccion', 'transacciones'
  inflect.irregular 'deposito', 'depositos'
  inflect.irregular 'retiro', 'retiros'
  inflect.irregular 'transferencia', 'transferencias'
  inflect.irregular 'comision', 'comisiones'
  inflect.irregular 'cuenta_general', 'cuentas_generales'
end

# These inflection rules are supported but not enabled by default:
# ActiveSupport::Inflector.inflections(:en) do |inflect|
#   inflect.acronym 'RESTful'
# end
