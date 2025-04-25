module Nerdify
    module Templates
        module OnepetReports
            def self.included(subclass)
                super(subclass)
        subclass.class_eval do
            # authenticate Manager

            # Página padrão index
            # - TopBar se layout default
            # - Menu fom Api::V1::Menu
            # - Submenu fom Api::V1::Submenu
            # - Actions only index e on header
            # - Lista de dados (só tabelas por enquanto)

            def self.controller_path
                self.to_s.underscore
            end


            page :index, model: model,
                                i18n_layout: "#{subclass.to_s.underscore.pluralize}.index",
                        controller: subclass.to_s.underscore,
                        header: { container: true, class: "bg-primary" },
                        filters: { container: true },
                        tutorial_model: "TutorialStep",
                        body: { container: true, margin: { bottom: 4, top: 4 } },
                        footer: { container: true },
                        resources: { router: { app_search: "" } },
                        without_page_header: ((model.nerdify.actions.select { |action| params = { controller: self.to_s.underscore, action: "index" }; action.name.to_sym == :index && (!action.options[:backend_if] || eval(action.options[:backend_if])) }.first || OpenStruct.new({ options: {} })).options[:without_page_header]) do
                nerdify_action = model.nerdify.actions.select do |action|
                    action.name.to_sym == :index && (!action.options[:backend_if].present? || eval(action.options[:backend_if]))
                end.first

                if self.options[:layout].to_s == "modal"
                    component :container, position: :header do
                        component :text, name: :"#{resource_symbol}_#{page.name}_title", type: :h3, static: true
                    end
                end

                if self.options[:layout].to_s == "default"
                    component :container, position: :header, size: 12, styles: { background: :primary, color: :white, border_color: :primary, align: { right: "horizontal" }, padding: { left: 1, top: 2, right: 1, bottom: 0 } } do
                        component :image, name: :logo, src: "assets/images/logo.png", static: true, image_size: 5, position: :left, i18n_layout: true, click: { redirect_to: "/" }

                        component :form, name: :search_form, resource: :router, size: 8, submit: { post: "/router", data: { router: ":resource.app_search" }, success: { update: "page" } }, styles: { margin: { left: 3, right: 3 }, display: "d-none d-md-block" } do
                            component :input, name: :app_search, submit_on_change: true, input_type: :select, without_arrow: true, inclusion: [], view: :editable, layout: :inline, submit_on_input: true, styles: { margin: { bottom: 0 } }, i18n_layout: true, size: 12, clear_on_submit: true, translate: true, custom_search: true
                        end

                        component :button, name: :menu, position: :right,  styles: { background: :transparent }, i18n_layout: true, only_icon_on_mobile: true do
                            component :container, position: :dropdown, styles: { orientation: { body: "horizontal" }, padding: {} } do
                                Nerdify::Config::Menu.new.folder_links("platform/modules").each do |menu_item|
                                    component :card, size: 3, styles: { padding: { bottom: 1, top: 1 }, align: { body: "center" } }, name: menu_item[:name], click: { redirect_to: menu_item[:path] }, i18n_layout: true, backend_if: "can? :menu, 'api/v1#{menu_item[:path]}'" do
                                        component :icon, name: :info, static: true, i18n_layout: true, styles: { color: "primary" }
                                        component :text, type: :span, name: menu_item[:name], static: true, i18n_layout: true
                                    end
                                end
                            end
                        end

                        component :button, name: :settings, position: :right, styles: { background: :transparent }, i18n_layout: true, only_icon_on_mobile: true do
                            component :container, position: :dropdown, styles: { orientation: { body: "horizontal" }, padding: {} } do
                                Nerdify::Config::Menu.new.folder_links("platform/settings").each do |menu_item|
                                    component :card, size: 3, styles: { padding: { bottom: 1, top: 1 }, align: { body: "center" } }, name: menu_item[:name], click: { redirect_to: menu_item[:path] }, i18n_layout: true, backend_if: "can? :menu, 'api/v1#{menu_item[:path]}'" do
                                        component :icon, name: :info, static: true, i18n_layout: true, styles: { color: "primary" }
                                        component :text, type: :span, name: menu_item[:name], static: true, i18n_layout: true
                                    end
                                end
                            end
                        end

                        component :container, position: :right, styles: { margin: { left: 2 }, padding: { left: 0, right: 0 } }, click: { redirect_to: "/integration/users/:resources.current_user.id", open_in: :dialog }, show_if: "this.page.resources.current_user" do
                            component :html, name: :icon, resource: "current_user", show_if: "this.page.resources.current_user.icon"
                          # component :text, type: :span, name: :name, resource: "current_user", styles: {color: "white", display: "d-none d-md-block"}, show_if: "this.page.resources.current_user.name"
                        end

                        component :icon, name: :notifications, static: true, position: :right, styles: { color: "white", padding: { left: 1, right: 1 } }

                        component :image, src: "/assets/images/flags/br.png", circle: true, static: true, image_size: 0, position: :right, styles: { margin: { left: 1, right: 1 } } do
                            component :container, position: :dropdown do
                                component :card, size: 3, styles: { padding: { bottom: 1, top: 1 }, align: { body: "center" } },  i18n_layout: true do
                                    component :image, src: "/assets/images/flags/br.png", circle: true, static: true, image_size: 0
                                    component :text, type: :span, name: "Português", static: true, i18n_layout: true
                                end
                                component :card, size: 3, styles: { padding: { bottom: 1, top: 1 }, align: { body: "center" } },  i18n_layout: true do
                                    component :image, src: "/assets/images/flags/en.png", circle: true, static: true, image_size: 0
                                    component :text, type: :span, name: "Inglês", static: true, i18n_layout: true
                                end
                                component :card, size: 3, styles: { padding: { bottom: 1, top: 1 }, align: { body: "center" } }, i18n_layout: true do
                                    component :image, src: "/assets/images/flags/fr.png", circle: true, static: true, image_size: 0
                                    component :text, type: :span, name: "Francês", static: true, i18n_layout: true
                                end
                                component :card, size: 3, styles: { padding: { bottom: 1, top: 1 }, align: { body: "center" } }, i18n_layout: true do
                                    component :image, src: "/assets/images/flags/it.png", circle: true, static: true, image_size: 0
                                    component :text, type: :span, name: "Italiano", static: true, i18n_layout: true
                                end
                                component :card, size: 3, styles: { padding: { bottom: 1, top: 1 }, align: { body: "center" } }, i18n_layout: true do
                                    component :image, src: "/assets/images/flags/ge.png", circle: true, static: true, image_size: 0
                                    component :text, type: :span, name: "Alemão", static: true, i18n_layout: true
                                end
                                component :card, size: 3, styles: { padding: { bottom: 1, top: 1 }, align: { body: "center" } }, i18n_layout: true do
                                    component :image, src: "/assets/images/flags/ch.png", circle: true, static: true, image_size: 0
                                    component :text, type: :span, name: "Chinês", static: true, i18n_layout: true
                                end
                                component :card, size: 3, styles: { padding: { bottom: 1, top: 1 }, align: { body: "center" } }, i18n_layout: true do
                                    component :image, src: "/assets/images/flags/ja.png", circle: true, static: true, image_size: 0
                                    component :text, type: :span, name: "Japonês", static: true, i18n_layout: true
                                end
                                component :card, size: 3, styles: { padding: { bottom: 1, top: 1 }, align: { body: "center" } }, i18n_layout: true do
                                    component :image, src: "/assets/images/flags/ru.png", circle: true, static: true, image_size: 0
                                    component :text, type: :span, name: "Russo", static: true, i18n_layout: true
                                end
                            end
                        end

                        component :container, size: 12, position: :bottom, styles: { padding: { left: 0, top: 0, right: 0, bottom: 0 }, margin: { top: 1 } } do
                            menu_path = self.page.controller.to_s.underscore.gsub("api/v1/", "").gsub(/\/[^\/]+$/, "").split("/")[0..2].join("/")
                            nav_items = Nerdify::Config::Menu.new.file_links(menu_path)
                            component :nav, name: :navigation, i18n_layout: true, styles: { color: "white", padding: { left: 0, top: 0, right: 0, bottom: 0 } }, items: nav_items
                        end
                    end

                    if !self.options[:without_page_header]
                        component :container do
                            component :text, name: :"#{resource_symbol}_#{page.name}_title", type: :h3, size: 12, static: true
                            component :text, name: :"#{resource_symbol}_#{page.name}_help", type: :p, size: 12, static: true

                            model.nerdify.actions.select { |action| action.name.to_sym == :tutorial && action.options[:only].include?("index") }.each do |action|
                                component :button, name: :tutorial, static: true, position: :right, styles: { background: "transparent", color: "primary" }, i18n_layout: true, click: { tutorial: true }, only_icon_on_mobile: true, backend_if: ((action.options[:backend_if] || "true") + " && can?(:#{action.name},(object || #{model}))")
                            end

                            model.nerdify.actions.select { |action| action.name.to_sym == :index }.each do |action|
                                if action.options[:lists].present?
                                    component :list_types, static: true, position: :right, lists: action.options[:lists]
                                end
                            end

                            model.nerdify.actions.select { |action| action.options[:only].include?("index") && action.options[:position].to_s == "header" }.each do |action|
                                component :button, name: :"#{action.name}_#{resource_symbol}", **action.options.merge(**{ position: :right, styles: (action.options[:styles] || { background: :primary }), click: (action.options[:click] || { redirect_to: action.name, open_in: action.options[:open_in] }), backend_if: ((action.options[:backend_if] || "true") + " && can?(:#{action.name},(object || #{model}))") }), only_icon_on_mobile: true
                            end
                        end
                    end
                end

                component :container, name: :body, size: 12, translate: false, styles: { vertical_align: { body: "top" } }  do
                    component :form, size: 12, id: "report_#{resource_symbol}", resource: :"#{resource_symbol}", submit: { get: ".", data: { "#{resource_symbol}": ":resource" }, success: { update: "resources", toast: :success }, error: { toast: :error, update: "components" } } do
                        model.nerdify.fieldsets.select { |ig| ig.options[:footer].blank? && (!ig.options[:only] || ig.options[:only].include?(page.name.to_s)) }.each do |child|
                            self.page.controller.fieldset_or_field(child, self, nil, nerdify_action)
                        end
                    end

                    model.nerdify.reports.select { |ig| (!ig.options[:only] || ig.options[:only].include?(page.name.to_s)) }.each do |child|
                        self.page.controller.report_or_chart(child, self)
                    end

                    list_actions = model.nerdify.actions.select { |action| action.options[:only].include?("index") && action.options[:on].to_s == "member" }.map(&:to_h)

                    model.nerdify.lists.each do |list|
                        self.page.controller.list_component(list, self)
                    end
                end
            end



          # page :index, model: model,
          #              controller: subclass.to_s.underscore,
          #              header: {container: true, class: 'bg-primary'},
          #              filters: {container: true},
          #              tutorial_model: "TutorialStep",
          #              body: {container: true, margin: {bottom: 4, top: 4}},
          #              footer: {container: true} do

          #     if self.options[:layout].to_s == 'modal'
          #         component :container, position: :header do
          #             component :text, name: :"#{resource_symbol}_#{page.name}_title", type: :h3, static: true
          #         end
          #     end

          #     if self.options[:layout].to_s == 'default'
          #         component :container, position: :header, size: 12, styles: {background: :primary, color: :white, border_color: :primary, align: {right: 'horizontal'}, padding: {left: 1, top: 2, right: 1, bottom: 0}} do
          #             component :image, name: :logo, src: "assets/images/logo.png", static: true, image_size: 5, position: :left, i18n_layout: true

          #             component :form, name: :search_form, resource: :router, size: 8, submit: {post: "/router", data: {router: ":resource.app_search"}, success: {update: "page"}}, styles: {margin: {left: 3, right: 3}, display: "d-none d-md-block"} do
          #                 component :input, name: :app_search, submit_on_change: true, input_type: :select, without_arrow: true, inclusion: [], view: :editable, layout: :inline, submit_on_input: true, styles: {margin: {bottom: 0}}, i18n_layout: true, size: 12, clear_on_submit: true, translate: true, custom_search: true
          #             end


          #             component :container, position: :right, click: {redirect_to: "/admin/account_management/#{page.controller.user_class.to_s.underscore.pluralize}/:resources.current_user.id", open_in: :dialog} do
          #                 component :html, name: :icon, resource: "current_user", show_if: "this.resources.current_user.icon"
          #                 component :text, type: :span, name: :name, resource: "current_user", styles: {color: "white", display: "d-none d-md-block"}, show_if: "this.resources.current_user.name"
          #             end
          #             component :button, name: :apps, position: :right, click: {popover: true}, i18n_layout: true, only_icon_on_mobile: true do
          #                 component :card, position: :popover, styles: {orientation: {body: 'horizontal'}, padding: {left: 2, top: 2, right: 2, bottom: 2}} do
          #                     Nerdify::Config::Menu.new.folder_links.each do |menu_item|
          #                         component :card, styles: {align: {body: "center"}}, name: menu_item[:name], click: {redirect_to: menu_item[:path]}, i18n_layout: true, backend_if: "can? :menu, 'api/v1#{menu_item[:path]}'" do
          #                             component :icon, name: menu_item[:icon], static: true, i18n_layout: true, styles: {color: "primary"}
          #                             component :text, type: :span, name: menu_item[:name], static: true, i18n_layout: true
          #                         end
          #                     end
          #                 end
          #             end

          #             component :button, name: :sign_out, i18n_layout: true, only_icon_on_mobile: true, position: :right, click: {
          #                 delete: "/#{page.controller.user_class.to_s.underscore.pluralize}/sign_out",
          #                 success: {redirect_to: "/"},
          #                 error: {toast: :error}
          #             }

          #             component :container, size: 12, position: :bottom, styles: {padding: {left: 0, top: 0, right: 0, bottom: 0}, margin: {top: 1}} do
          #                 component :nav, name: :navigation, i18n_layout: true, styles: {color: 'white', padding: {left: 0, top: 0, right: 0, bottom: 0}}, items: Nerdify::Config::Menu.new.file_links(self.page.controller.to_s.underscore.gsub('api/v1/', '').gsub(/\/[^\/]+$/, ''))
          #             end
          #         end

          #         component :container do
          #             component :text, name: :"#{resource_symbol}_#{page.name}_title", type: :h3, size: 12, static: true
          #             component :text, name: :"#{resource_symbol}_#{page.name}_help", type: :p, size: 12, static: true

          #             model.nerdify.actions.select{|action| action.name.to_sym == :tutorial && action.options[:only].include?('index') }.each do
          #                 component :button, name: :tutorial, static: true, position: :right, styles: {background: 'transparent', color: 'primary'}, i18n_layout: true, click: {tutorial: true}, only_icon_on_mobile: true
          #             end

          #             model.nerdify.actions.select{|action| action.options[:only].include?('index') && action.options[:position].to_s == 'header' }.each do |action|
          #                 component :button, name: :"#{action.name}_#{resource_symbol}", **action.options.merge(**{position: :right, styles: (action.options[:styles] || {background: :primary}), click: (action.options[:click] || {redirect_to: action.name, open_in: action.options[:open_in]}), backend_if: ((action.options[:backend_if] || "true") + " && can?(:#{action.name},(object || #{model}))")}), only_icon_on_mobile: true
          #             end
          #         end
          #     end

          #     component :form, id: "report_#{resource_symbol}", resource: :"#{resource_symbol}", submit: { get: '.', data: {"#{resource_symbol}": ":resource"}, success: {update: "resources,components", toast: :success}, error: {toast: :error, update: 'components'}} do
          #         model.nerdify.fieldsets.select{|ig| (!ig.options[:only] || ig.options[:only].include?(page.name.to_s))}.each do |child|
          #             self.page.controller.fieldset_or_field(child, self)
          #         end

          #         model.nerdify.actions.select{|action| action.options[:only].include?('index') && (!action.options[:position].present? || action.options[:position].to_s == 'body')  }.each do |action|
          #             component :button, name: :"#{action.name}_#{resource_symbol}",styles: (action.options[:styles] || {background: :primary}), click: action.options[:click], backend_if: ((action.options[:backend_if] || "true") + " && can?(:#{action.name},(object || #{model}))")
          #         end
          #     end

          #     model.nerdify.reports.select{|ig| (!ig.options[:only] || ig.options[:only].include?(page.name.to_s))}.each do |child|
          #         component :container, resource: :"#{resource_symbol}" do
          #             self.page.controller.report_or_chart(child, self)
          #         end
          #     end

          #     model.nerdify.lists.each do |list|
          #         case list.options[:type].to_s
          #         when 'cards'
          #             component :list, name: list.name, resources: :"#{resource_symbol.to_s.pluralize}", **{size: 12}.merge(list.options) do
          #                 component :card, size: list.options[:card_size], click: list.options[:click_item] do
          #                     list.components.each do |c|
          #                         self.page.controller.fieldset_or_field(c, self)
          #                         #component (c.options[:component] || :input), name: c.name, **c.options.merge({label: false, view: :viewonly, layout: :inline})
          #                     end
          #                 end
          #             end
          #         when 'calendar'
          #             component :calendar, name: list.name, resources: :"#{resource_symbol.to_s.pluralize}", **{size: 12}.merge(list.options) do
          #             end
          #         when 'kanban'
          #             component :kanban, name: list.name, resources: :"#{resource_symbol.to_s.pluralize}", **{size: 12}.merge(list.options) do
          #                 component :card, size: list.options[:card_size], click: list.options[:click_item] do
          #                     list.components.each do |c|
          #                         component (c.options[:component] || :input), name: c.name, **c.options.merge({label: false, view: :viewonly, layout: :inline})
          #                     end
          #                 end
          #             end
          #         when 'timeline'
          #             component :timeline, name: list.name, resources: :"#{resource_symbol.to_s.pluralize}", **{size: 12}.merge(list.options) do
          #                 component :container, size: list.options[:card_size], click: list.options[:click_item] do
          #                     list.components.each do |c|
          #                         component (c.options[:component] || :input), name: c.name, **c.options.merge({label: false, view: :viewonly, layout: :inline})
          #                     end
          #                 end
          #             end
          #         when 'table'
          #             component :table, name: list.name, table_header: list.components.map{|c| c.name}, resources: :"#{resource_symbol.to_s.pluralize}", **{size: 12, click_item: (list.options[:click_item]), styles: (list.options[:styles] || {rounded: {top_left: 2, top_right: 2, bottom_left: 2, bottom_right: 2}})}.merge(**list.options) do
          #                 if list.options[:thead]
          #                     component :table_head, position: :top do
          #                         list.components.each do |column|
          #                             component (column.options[:component] || :input), name: column.name, **column.options
          #                         end
          #                     end
          #                 end
          #                 component :table_body do
          #                     list.components.each do |column|
          #                         component (column.options[:component] || :input), name: column.name, **column.options.merge({view: :viewonly, layout: :inline, label: false})
          #                     end
          #                 end
          #             end
          #         end
          #     end


          # end
        end
            end
        end
    end
end
